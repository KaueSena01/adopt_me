import 'package:adopt_me/layers/data/repositories/auth/auth_repository_impl.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/email_and_passowrd_sign_in_usecase_impl.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/register_usecase_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/data/data_sources/remote/auth/auth_datasource_impl.dart';
import 'package:adopt_me/layers/domain/use_cases/auth/google_sign_in_usecase_impl.dart';
import 'package:adopt_me/layers/presentation/controller.dart';
import 'package:adopt_me/layers/presentation/pages/auth/widgets/background.dart';
import 'package:adopt_me/layers/presentation/pages/auth/widgets/enter_with.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_outlined_button.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_space.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_text_field.dart';
import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/layers/presentation/pages/auth/widgets/app_name.dart';
import 'package:adopt_me/layers/presentation/pages/auth/register_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController(
      GoogleSignInUseCaseImpl(
        AuthRepositoryImpl(
          AuthDataSourceImpl(),
        ),
      ),
      EmailAndPasswordSignInUseCaseImpl(
        AuthRepositoryImpl(
          AuthDataSourceImpl(),
        ),
      ),
      RegisterUseCaseImpl(
        AuthRepositoryImpl(
          AuthDataSourceImpl(),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: background(
            context,
            Padding(
              padding: EdgeInsets.all(AppSizes.size15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    appName(context),
                    CustomTextField(
                      labelText: "E-mail",
                      hintText: "Digite seu e-mail",
                      margin: EdgeInsets.only(
                        top: AppSizes.size20,
                        bottom: AppSizes.size15,
                      ),
                      controller: _emailController,
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
                          controller: _passwordController,
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
                              onPressed: () => Get.to(const RegisterPage()),
                            ),
                          ),
                          CustomSpace(width: AppSizes.size10),
                          Expanded(
                            flex: 2,
                            child: CustomElevatedButton(
                              label: "Entrar",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  authController.emailAndPassowrLogin(
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                                }
                              },
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
      ),
    );
  }
}
