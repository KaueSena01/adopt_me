import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';
import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';

class SingInUseCase {
  final AuthRepository authRepository;

  SingInUseCase({required this.authRepository});

  Future<void> call(AuthEntity authEntity) async {
    return await authRepository.signIn(authEntity);
  }
}
