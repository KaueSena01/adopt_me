import 'dart:developer';

import 'package:adopt_me/core/utils/format_exception.dart';
import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/sign_in_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase.dart';
import 'package:adopt_me/layers/presentation/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GoogleSignInUseCase _googleSignInUseCase;
  final SingInUseCase _singInUseCase;

  AuthCubit(
    this._googleSignInUseCase,
    this._singInUseCase,
  ) : super(AuthInitial());

  Future<void> googleSignIn() async {
    emit(AuthLoading());
    try {
      await _googleSignInUseCase.call();
      emit(AuthSuccess());
    } catch (_) {
      log(formatException(_.toString()));
      emit(AuthFailure(message: formatException(_.toString())));
    }
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      await _singInUseCase.call(
        AuthEntity(
          email: email,
          password: password,
        ),
      );
      emit(AuthSuccess());
    } catch (_) {
      log(formatException(_.toString()));
      emit(AuthFailure(message: formatException(_.toString())));
    }
  }

  // register
  // getCurrentUserid
}
