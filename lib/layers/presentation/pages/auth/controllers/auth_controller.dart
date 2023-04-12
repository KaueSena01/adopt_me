import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/get_current_uid_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/register_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/sign_in_usecase.dart';
import 'package:adopt_me/layers/presentation/pages/user/controllers/user_controller.dart';
import 'package:get_it/get_it.dart';

class AuthController {
  final GoogleSignInUseCase _googleSignInUseCase;
  final SingInUseCase _singInUseCase;
  final RegisterUseCase _registerUseCase;
  final GetCurrentUIDUseCase _getCurrentUIDUseCase;

  var userController = GetIt.I.get<UserController>();

  AuthController(
    this._googleSignInUseCase,
    this._singInUseCase,
    this._registerUseCase,
    this._getCurrentUIDUseCase,
  );

  googleSignIn() async {
    await _googleSignInUseCase.call();
  }

  signIn(String email, String password) async {
    await _singInUseCase.call(
      AuthEntity(
        email: email,
        password: password,
      ),
    );
  }

  register(String name, String email, String password, String about) async {
    await _registerUseCase.call(
      AuthEntity(
        email: email,
        password: password,
      ),
    );

    final uid = await _getCurrentUIDUseCase.call();

    await userController.createUser(
      UserEntity(
        aboutMe: about,
        email: email,
        location: 'Crateús - CE',
        name: name,
        password: password,
        profileUrl: 'url',
        uid: uid,
      ),
    );
  }
}
