import 'package:adopt_me/layers/data/data_sources/auth/auth_datasource.dart';
import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<void> googleAuth() async => await authDataSource.googleAuth();

  @override
  Future<void> emailAndPasswordAuth(
    String email,
    String password,
  ) async =>
      await authDataSource.emailAndPasswordAuth(email, password);

  @override
  Future<void> register(
    String name,
    String email,
    String password,
    String about,
  ) async {
    await authDataSource.register(name, email, password, about);
  }
}
