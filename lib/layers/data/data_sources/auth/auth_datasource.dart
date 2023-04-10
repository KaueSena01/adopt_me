import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';

abstract class AuthDataSource {
  Future<void> googleSignIn();
  Future<void> signIn(AuthEntity authEntity);
  Future<void> register(AuthEntity authEntity);
}
