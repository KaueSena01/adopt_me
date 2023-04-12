import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository authRepository;

  GoogleSignInUseCase({required this.authRepository});

  Future<void> call() async {
    return await authRepository.googleSignIn();
  }
}
