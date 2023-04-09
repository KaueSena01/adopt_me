import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/register_usecase.dart';

class RegisterUseCaseImpl implements RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCaseImpl(this.authRepository);

  @override
  Future<void> call(
    String name,
    String email,
    String password,
    String about,
  ) {
    return authRepository.register(name, email, password, about);
  }
}
