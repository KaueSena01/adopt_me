import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';

abstract class UserDataSource {
  Future<void> createUser(UserEntity userEntity);
}
