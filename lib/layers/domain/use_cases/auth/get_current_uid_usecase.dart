import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';

class GetCurrentUIDUseCase {
  final AuthRepository authRepository;

  GetCurrentUIDUseCase({required this.authRepository});

  Future<String> call() async {
    return await authRepository.getCurrentUId();
  }
}
