import 'package:adopt_me/layers/data/datasources/remote/auth_datasource_impl.dart';
import 'package:adopt_me/layers/data/repositories/auth_repository_impl.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase_impl.dart';
import 'package:adopt_me/layers/presentation/controller.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  var controller = AuthController(
    GoogleSignInUseCaseImpl(
      AuthRepositoryImpl(
        AuthDataSourceImpl(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Botão"),
              onPressed: () => controller.signInWithGoogle(),
            ),
            const Text("Texto")
          ],
        ),
      ),
    );
  }
}
