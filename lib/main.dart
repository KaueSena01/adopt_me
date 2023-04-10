import 'package:adopt_me/core/configs/inject.dart';
import 'package:adopt_me/layers/presentation/pages/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:adopt_me/core/constants/theme/app_theme.dart';
import 'package:adopt_me/firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Inject.init();

  runApp(AdoptMe());
}

class AdoptMe extends StatelessWidget {
  AdoptMe({super.key});

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: _globalKey,
      theme: AppTheme.themeData,
      title: 'Adopt Me',
      home: const RegisterPage(),
    );
  }
}
