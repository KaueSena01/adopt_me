import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';
import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository authRepository;

  GoogleSignInUseCase({required this.authRepository});

  Future<AuthEntity> call() async {
    return await authRepository.googleSignIn();
  }
}
