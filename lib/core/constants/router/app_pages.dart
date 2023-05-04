import 'dart:io';

import 'package:adopt_me/core/constants/router/app_routes.dart';
import 'package:adopt_me/layers/presentation/pages/auth/login_page.dart';
import 'package:adopt_me/layers/presentation/pages/auth/register_page.dart';
import 'package:adopt_me/layers/presentation/pages/user/edit_profile_page.dart';
import 'package:adopt_me/layers/presentation/pages/user/preview_page.dart';
import 'package:adopt_me/layers/presentation/pages/user/settings_page.dart';
import 'package:flutter/material.dart';

abstract class AppPages {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LogInPage(),
        );
      case AppRoutes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case AppRoutes.editProfileRoute:
        return MaterialPageRoute(
          builder: (_) => const EditProfilePage(),
        );
      case AppRoutes.previewRoute:
        final arguments = routeSettings.arguments as File;
        return MaterialPageRoute(
          builder: (_) => PreviewPage(file: arguments),
        );
      case AppRoutes.settingsRoute:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const LogInPage(),
        );
    }
  }
}
