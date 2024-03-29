import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';

abstract class AuthRepository {
  Future<String> getCurrentUId();
  Future<AuthEntity> googleSignIn();
  Future<void> signIn(AuthEntity authEntity);
  Future<void> register(AuthEntity authEntity);
}
