import 'package:adopt_me/layers/domain/use_cases/auth/email_and_passowrd_sign_in_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/register_usecase.dart';

class AuthController {
  final GoogleSignInUseCase _googleSignInUseCase;
  final EmailAndPasswordSignInUseCase _emailAndPasswordSignInUseCase;
  final RegisterUseCase _registerUseCase;

  AuthController(this._googleSignInUseCase, this._emailAndPasswordSignInUseCase,
      this._registerUseCase);

  signInWithGoogle() async {
    await _googleSignInUseCase.call();
  }

  emailAndPassowrLogin(String email, String password) async {
    await _emailAndPasswordSignInUseCase.call(email, password);
  }

  register(String name, String email, String password, String about) async {
    await _registerUseCase.call(name, email, password, about);
  }
}
