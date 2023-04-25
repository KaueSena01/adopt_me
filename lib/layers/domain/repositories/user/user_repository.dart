import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<void> createUser(UserEntity userEntity);
  Future<UserEntity> getCurrentUser();
}
