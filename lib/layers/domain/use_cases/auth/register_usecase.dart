import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';
import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<void> call(AuthEntity authEntity) {
    return authRepository.register(authEntity);
  }
}
