import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:adopt_me/core/utils/format_exception.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_state.dart';
import 'package:adopt_me/layers/domain/use_cases/user/create_user_usecase.dart';

class UserCubit extends Cubit<UserState> {
  final CreateUserUseCase _createUserUseCase;

  UserCubit(
    this._createUserUseCase,
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
}
