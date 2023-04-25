import 'package:adopt_me/core/configs/inject.dart' as inject;
import 'package:adopt_me/core/constants/router/app_pages.dart';
import 'package:adopt_me/core/constants/router/app_routes.dart';
import 'package:adopt_me/layers/presentation/cubit/auth/auth_cubit.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_cubit.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:adopt_me/core/constants/theme/app_theme.dart';
import 'package:adopt_me/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await inject.init();

  runApp(AdoptMe());
}

class AdoptMe extends StatelessWidget {
  AdoptMe({super.key});

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (_) => inject.getIt<UserCubit>()..getCurrentUser(),
        ),
        BlocProvider<AuthCubit>(
          create: (_) => inject.getIt<AuthCubit>(),
        ),
      ],
      child: GetMaterialApp(
        key: _globalKey,
        builder: Asuka.builder,
        theme: AppTheme.themeData,
        themeMode: ThemeMode.system,
        title: 'Adopt Me',
        debugShowCheckedModeBanner: false,
        getPages: AppPages.appPages,
        initialRoute: AppRoutes.loginRoute,
      ),
    );
  }
}
