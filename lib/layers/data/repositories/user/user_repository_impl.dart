import 'package:adopt_me/layers/data/data_sources/user/user_datasource.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/domain/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<void> createUser(UserEntity userEntity) async =>
      await userDataSource.createUser(userEntity);
}
