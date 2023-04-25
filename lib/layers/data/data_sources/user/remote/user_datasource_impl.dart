import 'dart:developer';

import 'package:adopt_me/layers/data/data_sources/user/user_datasource.dart';
import 'package:adopt_me/layers/data/dtos/user/user_dto.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth firebaseAuth;

  UserDataSourceImpl(this.fireStore, this.firebaseAuth);

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
}
