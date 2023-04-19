import 'package:adopt_me/layers/domain/repositories/user/user_repository.dart';

class GetCurrentUserUseCase {
  final UserRepository userRepository;

  GetCurrentUserUseCase({required this.userRepository});
}
