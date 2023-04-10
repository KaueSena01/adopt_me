import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/register_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/sign_in_usecase.dart';

class AuthController {
  final GoogleSignInUseCase _googleSignInUseCase;
  final SingInUseCase _singInUseCase;
  final RegisterUseCase _registerUseCase;

  AuthController(
    this._googleSignInUseCase,
    this._singInUseCase,
    this._registerUseCase,
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
        name: name,
        email: email,
        password: password,
        aboutMe: about,
      ),
    );
  }
}
