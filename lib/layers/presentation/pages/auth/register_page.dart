import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/layers/presentation/pages/auth/widgets/app_bar.dart';
import 'package:adopt_me/layers/presentation/pages/auth/widgets/background.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_text_field.dart';
import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/presentation/pages/auth/controllers/login_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  var authController = GetIt.I.get<AuthController>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: background(
          context,
          Column(
            children: [
              appBar(context),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          labelText: "Nome",
                          hintText: "Digite seu nome",
                          margin: EdgeInsets.only(
                            top: AppSizes.size20,
                            bottom: AppSizes.size15,
                          ),
                          controller: _nameController,
                        ),
                        CustomTextField(
                          labelText: "E-mail",
                          hintText: "Digite seu e-mail",
                          margin: EdgeInsets.only(
                            top: AppSizes.size20,
                            bottom: AppSizes.size15,
                          ),
                          controller: _emailController,
                        ),
                        CustomTextField(
                          labelText: "Senha",
                          hintText: "Digite sua senha",
                          isSecret: true,
                          margin: EdgeInsets.only(
                            top: AppSizes.size20,
                            bottom: AppSizes.size15,
                          ),
                          controller: _passwordController,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              labelText: "Sobre mim",
                              hintText:
                                  "Apresente-se brevemente para a comunidade",
                              margin: EdgeInsets.only(
                                top: AppSizes.size20,
                                bottom: AppSizes.size05,
                              ),
                              controller: _aboutController,
                            ),
                            Text(
                              '* Isso ajudará os outros usuários a conhecê-lo melhor e a conectar-se com pessoas que tenham interesses em comum.',
                              style:
                                  AppTextStyles.textTheme.headlineSmall!.apply(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomElevatedButton(
                label: "Criar conta",
                margin: EdgeInsets.symmetric(
                  vertical: AppSizes.size20,
                  horizontal: AppSizes.size15,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authController.register(
                      _nameController.text,
                      _emailController.text,
                      _passwordController.text,
                      _aboutController.text,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
