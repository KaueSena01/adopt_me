import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/domain/repositories/user/user_repository.dart';

class GetCurrentUserUseCase {
  final UserRepository userRepository;

  GetCurrentUserUseCase({required this.userRepository});

  Future<UserEntity> call() async {
    return await userRepository.getCurrentUser();
  }
}
