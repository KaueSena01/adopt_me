import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/domain/use_cases/user/create_user_usecase.dart';

class UserController {
  final CreateUserUseCase _createUserUseCase;

  UserController(
    this._createUserUseCase,
  );

  createUser(UserEntity userEntity) async {
    await _createUserUseCase.call(userEntity);
  }
}
