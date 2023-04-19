import 'package:adopt_me/core/constants/router/app_routes.dart';
import 'package:adopt_me/layers/presentation/pages/auth/login_page.dart';
import 'package:adopt_me/layers/presentation/pages/auth/register_page.dart';
import 'package:adopt_me/layers/presentation/pages/user/edit_profile_page.dart';
import 'package:adopt_me/layers/presentation/pages/user/settings_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final appPages = <GetPage>[
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => const LogInPage(),
    ),
    GetPage(
      name: AppRoutes.registerRoute,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.editProfileRoute,
      page: () => EditProfilePage(),
    ),
    GetPage(
      name: AppRoutes.settingsRoute,
      page: () => const SettingsPage(),
    ),
  ];
}
