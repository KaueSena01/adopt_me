import 'package:adopt_me/layers/data/data_sources/user/user_datasource.dart';
import 'package:adopt_me/layers/data/dtos/user/user_dto.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore firestore;

  UserDataSourceImpl(this.firestore);

  @override
  Future<void> createUser(UserEntity userEntity) async {
    final userCollection = firestore.collection("users");
    const uid = "";
    userCollection.doc(uid).get().then((user) {
      final newUser = UserDTO(
        uid: uid,
        name: userEntity.name,
        email: userEntity.email,
        aboutMe: userEntity.aboutMe,
        location: userEntity.location,
        profileUrl: userEntity.profileUrl,
      ).toDocument();

      if (!user.exists) {
        userCollection.doc(uid).set(newUser);
        return;
      } else {
        userCollection.doc(uid).update(newUser);
        print("user already exist");
        return;
      }
    }).catchError((error) {
      print(error);
    });
  }
}
