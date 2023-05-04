import 'dart:developer';
import 'package:adopt_me/layers/domain/use_cases/user/get_current_user_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/user/update_profile_pic_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/user/update_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:adopt_me/core/utils/format_exception.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_state.dart';
import 'package:adopt_me/layers/domain/use_cases/user/create_user_usecase.dart';

class UserCubit extends Cubit<UserState> {
  final CreateUserUseCase _createUserUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  final UpdateProfilePicUseCase _updateProfilePicUseCase;
  UserEntity? userEntity;

  UserCubit(
    this._createUserUseCase,
    this._getCurrentUserUseCase,
    this._updateUserUseCase,
    this._updateProfilePicUseCase,
  ) : super(UserInitial());

  Future<void> createUser(UserEntity userEntity) async {
    emit(UserLoading());
    try {
      await _createUserUseCase.call(userEntity);
      emit(UserSuccess());
    } catch (_) {
      log(formatException(_.toString()));
      emit(UserFailure(message: formatException(_.toString())));
    }
  }

  Future<void> getCurrentUser() async {
    emit(UserLoading());
    try {
      final user = await _getCurrentUserUseCase.call();
      userEntity = user;
      emit(UserSuccess());
    } catch (_) {
      log(formatException(_.toString()));
      emit(UserFailure(message: formatException(_.toString())));
    }
  }

  Future<void> updateUser(
    String name,
    String email,
    String phone,
    String about,
    String location,
    String profileUrl,
  ) async {
    emit(UserLoading());
    try {
      await _updateUserUseCase.call(
        UserEntity(
          name: name,
          email: email,
          phone: phone,
          aboutMe: about,
          location: location,
          profileUrl: profileUrl,
        ),
      );
      emit(UserSuccess());
    } catch (_) {
      log(formatException(_.toString()));
      emit(UserFailure(message: formatException(_.toString())));
    }
  }

  Future<void> updateProfilePic(String path) async {
    emit(UserLoading());
    try {
      await _updateProfilePicUseCase.call(path);
      emit(UserSuccess());
    } catch (_) {
      log(formatException(_.toString()));
      emit(UserFailure(message: formatException(_.toString())));
    }
  }
}
