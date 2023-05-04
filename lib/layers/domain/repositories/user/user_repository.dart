import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<void> createUser(UserEntity userEntity);
  Future<UserEntity> getCurrentUser();
  Future<void> updateUser(UserEntity userEntity);
  Future<void> updateProfilePic(String path);
}
