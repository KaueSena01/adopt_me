import 'package:adopt_me/layers/domain/repositories/user/user_repository.dart';

class UpdateProfilePicUseCase {
  final UserRepository userRepository;

  UpdateProfilePicUseCase({required this.userRepository});

  Future<void> call(String path) async {
    await userRepository.updateProfilePic(path);
  }
}
