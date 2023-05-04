import 'dart:developer';
import 'dart:io';

import 'package:adopt_me/layers/data/data_sources/user/user_datasource.dart';
import 'package:adopt_me/layers/data/dtos/user/user_dto.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;

  UserDataSourceImpl(
    this.fireStore,
    this.firebaseAuth,
    this.firebaseStorage,
  );

  @override
  Future<void> createUser(UserEntity userEntity) async {
    final userCollection = fireStore.collection("users");
    final uid = userEntity.uid;

    userCollection.doc(uid).get().then((userDoc) {
      final user = UserDTO(
        uid: userEntity.uid,
        name: userEntity.name,
        email: userEntity.email,
        aboutMe: userEntity.aboutMe,
        location: userEntity.location,
        profileUrl: userEntity.profileUrl,
      ).toDocument();

      userCollection.doc(uid).set(user);
    }).catchError((error) {
      log(error);
    });
  }

  @override
  Future<UserDTO> getCurrentUser() async {
    final uid = firebaseAuth.currentUser!.uid;

    var userData = await fireStore.collection('users').doc(uid).get();

    UserDTO userDTO = UserDTO.fromMap(userData.data()!);

    return userDTO;
  }

  @override
  Future<void> updateProfilePic(String path) async {
    try {
      final uid = firebaseAuth.currentUser!.uid;

      if (path.isEmpty) {
        await firebaseStorage.ref().child('profileUrl/$uid').delete();
      } else {
        UploadTask uploadTask =
            firebaseStorage.ref().child('profileUrl/$uid').putFile(File(path));

        TaskSnapshot snap = await uploadTask;

        String downloadUrl = await snap.ref.getDownloadURL();

        await fireStore.collection('users').doc(uid).update(
          {'profileUrl': downloadUrl},
        );
      }
    } catch (_) {
      throw Exception('Erro ao salvar sua foto');
    }
  }

  @override
  Future<void> updateUser(UserEntity userEntity) async {
    final userCollection = fireStore.collection("users");
    final uid = firebaseAuth.currentUser!.uid;

    userCollection.doc(uid).get().then((userDoc) {
      final updatedUser = UserDTO(
        uid: uid,
        name: userEntity.name,
        email: userEntity.email,
        phone: userEntity.phone,
        aboutMe: userEntity.aboutMe,
        location: userEntity.location,
        profileUrl: userEntity.profileUrl,
      ).toDocument();

      userCollection.doc(uid).update(updatedUser);
    }).catchError((error) {
      log(error);
      throw Exception('Erro ao atualizar');
    });
  }
}
