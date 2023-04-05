import 'package:adopt_me/layers/domain/repositories/auth_repository.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase.dart';

class GoogleSignInUseCaseImpl implements GoogleSignInUseCase {
  final AuthRepository authRepository;

  GoogleSignInUseCaseImpl(this.authRepository);

  @override
  Future<void> call() {
    return authRepository.googleAuth();
  }
}
