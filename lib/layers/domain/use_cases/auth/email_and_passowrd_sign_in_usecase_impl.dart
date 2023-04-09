import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/email_and_passowrd_sign_in_usecase.dart';

class EmailAndPasswordSignInUseCaseImpl
    implements EmailAndPasswordSignInUseCase {
  final AuthRepository authRepository;

  EmailAndPasswordSignInUseCaseImpl(this.authRepository);

  @override
  Future<void> call(String email, String password) {
    return authRepository.emailAndPasswordAuth(email, password);
  }
}
