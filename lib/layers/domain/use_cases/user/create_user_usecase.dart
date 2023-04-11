import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/domain/repositories/user/user_repository.dart';

class CreateUserUseCase {
  final UserRepository userRepository;

  CreateUserUseCase({required this.userRepository});

  Future<void> call(UserEntity userEntity) async {
    return await userRepository.createUser(userEntity);
  }
}
