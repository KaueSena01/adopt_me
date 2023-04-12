import 'package:adopt_me/layers/data/data_sources/auth/auth_datasource.dart';
import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';
import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<void> googleSignIn() async => await authDataSource.googleSignIn();

  @override
  Future<void> signIn(AuthEntity authEntity) async =>
      await authDataSource.signIn(authEntity);

  @override
  Future<void> register(AuthEntity authEntity) async =>
      await authDataSource.register(authEntity);

  @override
  Future<String> getCurrentUId() async => await authDataSource.getCurrentUId();
}
