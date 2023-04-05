import 'package:adopt_me/layers/data/datasources/auth_datasource.dart';
import 'package:adopt_me/layers/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<void> googleAuth() async => await authDataSource.googleAuth();
}
