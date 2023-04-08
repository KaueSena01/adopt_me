import 'package:flutter/material.dart';

import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/data/datasources/remote/auth_datasource_impl.dart';
import 'package:adopt_me/layers/data/repositories/auth_repository_impl.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase_impl.dart';
import 'package:adopt_me/layers/presentation/controller.dart';
import 'package:adopt_me/layers/presentation/pages/auth/widgets/background.dart';
import 'package:adopt_me/layers/presentation/pages/auth/widgets/enter_with.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_outlined_button.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_space.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_text_field.dart';
import 'package:adopt_me/core/constants/theme/app_colors.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController(
      GoogleSignInUseCaseImpl(
        AuthRepositoryImpl(
          AuthDataSourceImpl(),
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          child: background(
            context,
            Padding(
              padding: EdgeInsets.all(AppSizes.size15),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.size60),
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textTheme.titleSmall!.apply(
                        color: AppColors.whiteColor,
                      ),
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Bem vindo a\n',
                          ),
                          TextSpan(
                            text: 'ADOPT ME',
                            style: AppTextStyles.textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomTextField(
                    labelText: "E-mail",
                    hintText: "Digite seu e-mail",
                    margin: EdgeInsets.only(
                      top: AppSizes.size20,
                      bottom: AppSizes.size15,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        labelText: "Senha",
                        hintText: "Digite sua senha",
                        isSecret: true,
                        margin: EdgeInsets.only(
                          top: AppSizes.size20,
                          bottom: AppSizes.size05,
                        ),
                      ),
                      Text(
                        'Esqueceu a senha',
                        style: AppTextStyles.textTheme.headlineSmall!.apply(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppSizes.size50),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomOutlinedButton(
                            label: "Criar conta",
                            onPressed: () {},
                          ),
                        ),
                        CustomSpace(width: AppSizes.size10),
                        Expanded(
                          flex: 2,
                          child: CustomElevatedButton(
                            label: "Entrar",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  enterWith(context),
                  CustomOutlinedButton(
                    label: "Entrar com o Google",
                    iconPath: "assets/icons/google.svg",
                    onPressed: () async =>
                        await authController.signInWithGoogle(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
