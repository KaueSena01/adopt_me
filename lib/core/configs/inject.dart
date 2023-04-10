import 'package:get_it/get_it.dart';

import 'package:adopt_me/layers/data/data_sources/auth/auth_datasource.dart';
import 'package:adopt_me/layers/data/data_sources/remote/auth/auth_datasource_impl.dart';
import 'package:adopt_me/layers/data/repositories/auth/auth_repository_impl.dart';
import 'package:adopt_me/layers/domain/repositories/auth/auth_repository.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/register_usecase.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/sign_in_usecase.dart';
import 'package:adopt_me/layers/presentation/pages/auth/controllers/login_controller.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // DataSources
    getIt.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(),
    );

    // Repositories
    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: getIt()),
    );

    // UseCases
    getIt.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(authRepository: getIt()),
    );
    getIt.registerLazySingleton<SingInUseCase>(
      () => SingInUseCase(authRepository: getIt()),
    );
    getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(authRepository: getIt()),
    );

    // Controller
    getIt.registerFactory<AuthController>(
      () => AuthController(getIt(), getIt(), getIt()),
    );
  }
}
