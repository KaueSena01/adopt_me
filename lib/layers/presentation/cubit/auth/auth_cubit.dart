import 'dart:developer';

import 'package:adopt_me/core/utils/format_exception.dart';
import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/get_current_uid_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/register_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/sign_in_usecase.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase.dart';
import 'package:adopt_me/layers/presentation/cubit/auth/auth_state.dart';
import 'package:get_it/get_it.dart';

class AuthCubit extends Cubit<AuthState> {
  final GoogleSignInUseCase _googleSignInUseCase;
  final SingInUseCase _singInUseCase;
  final RegisterUseCase _registerUseCase;
  final GetCurrentUIDUseCase _getCurrentUIDUseCase;

  var userCubit = GetIt.I.get<UserCubit>();

  AuthCubit(
    this._googleSignInUseCase,
    this._singInUseCase,
    this._registerUseCase,
    this._getCurrentUIDUseCase,
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

  Future<void> register(
    String name,
    String email,
    String password,
    String about,
  ) async {
    emit(AuthLoading());
    try {
      await _registerUseCase.call(
        AuthEntity(
          email: email,
          password: password,
        ),
      );

      final uid = await _getCurrentUIDUseCase.call();

      await userCubit.createUser(
        UserEntity(
          aboutMe: about,
          email: email,
          name: name,
          uid: uid,
        ),
      );

      emit(AuthSuccess());
    } catch (_) {
      log(formatException(_.toString()));
      emit(AuthFailure(message: formatException(_.toString())));
    }
  }
}
