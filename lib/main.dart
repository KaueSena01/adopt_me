import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:adopt_me/core/constants/theme/app_theme.dart';
import 'package:adopt_me/firebase_options.dart';
import 'package:adopt_me/layers/presentation/pages/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(AdoptMe());
}

class AdoptMe extends StatelessWidget {
  AdoptMe({super.key});

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _globalKey,
      theme: AppTheme.themeData,
      title: 'Adopt Me',
      home: const LogInPage(),
    );
  }
}
