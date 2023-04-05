import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase.dart';

class AuthController {
  final GoogleSignInUseCase _googleSignInUseCase;

  AuthController(this._googleSignInUseCase);

  signInWithGoogle() async {
    await _googleSignInUseCase.call();
  }
}
