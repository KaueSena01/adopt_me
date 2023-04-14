import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase.dart';
import 'package:adopt_me/layers/presentation/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GoogleSignInUseCase _googleSignInUseCase;

  AuthCubit(this._googleSignInUseCase) : super(AuthInitial());

  Future<void> googleSignIn() async {
    emit(AuthLoading());
    try {
      await _googleSignInUseCase.call();
      emit(AuthSuccess());
    } catch (_) {
      emit(AuthFailure());
    }
  }
}
