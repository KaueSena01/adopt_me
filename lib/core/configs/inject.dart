import 'package:adopt_me/layers/data/data_sources/auth/remote/auth_datasource_impl.dart';
import 'package:adopt_me/layers/data/data_sources/user/remote/user_datasource_impl.dart';
import 'package:adopt_me/layers/data/data_sources/user/user_datasource.dart';
import 'package:adopt_me/layers/data/repositories/user/user_repository_impl.dart';
import 'package:adopt_me/layers/domain/repositories/user/user_repository.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/get_current_uid_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/user/create_user_usecase.dart';
import 'package:adopt_me/layers/presentation/cubit/auth/auth_cubit.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:adopt_me/layers/data/data_sources/auth/auth_datasource.dart';
import 'package:adopt_me/layers/data/repositories/auth/auth_repository_impl.dart';
import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/register_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/sign_in_usecase.dart';
import 'package:google_sign_in/google_sign_in.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  getIt.registerLazySingleton(() => fireStore);
  getIt.registerLazySingleton(() => firebaseAuth);
  getIt.registerLazySingleton(() => googleSignIn);

  // Cubit
  getIt.registerFactory<AuthCubit>(
      () => AuthCubit(getIt(), getIt(), getIt(), getIt()));
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt()));

  // DataSources
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(getIt(), getIt(), getIt()),
  );
  getIt.registerLazySingleton<UserDataSource>(
    () => UserDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: getIt()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userDataSource: getIt()),
  );

  // UseCases
  // Auth
  getIt.registerLazySingleton<GoogleSignInUseCase>(
    () => GoogleSignInUseCase(authRepository: getIt()),
  );
  getIt.registerLazySingleton<SingInUseCase>(
    () => SingInUseCase(authRepository: getIt()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepository: getIt()),
  );
  getIt.registerLazySingleton<GetCurrentUIDUseCase>(
    () => GetCurrentUIDUseCase(authRepository: getIt()),
  );
  // User
  getIt.registerLazySingleton<CreateUserUseCase>(
    () => CreateUserUseCase(userRepository: getIt()),
  );
}
