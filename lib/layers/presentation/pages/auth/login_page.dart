import 'package:adopt_me/core/functions/navigator.dart';
import 'package:adopt_me/core/validators/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/router/app_routes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_space.dart';
import 'package:adopt_me/layers/presentation/cubit/auth/auth_cubit.dart';
import 'package:adopt_me/layers/presentation/cubit/auth/auth_state.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_text_field.dart';
import 'package:adopt_me/layers/presentation/pages/auth/widgets/app_name.dart';
import 'package:adopt_me/layers/presentation/pages/auth/widgets/background.dart';
import 'package:adopt_me/layers/presentation/pages/auth/widgets/enter_with.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_outlined_button.dart';
import 'package:adopt_me/layers/presentation/pages/auth/handlers/auth_state_handler.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  final blocProvider = BlocProvider.of<AuthCubit>;

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
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, authState) => AuthStateHandler.handleAuthState(
            context,
            authState,
          ),
          builder: (context, authState) {
            return SingleChildScrollView(
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
                          validator: emailValidator,
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
                              validator: passwordValidator,
                            ),
                            Text(
                              'Esqueceu a senha',
                              style:
                                  AppTextStyles.textTheme.headlineSmall!.apply(
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
                                  onPressed: () => navigateTo(
                                      context, AppRoutes.registerRoute),
                                ),
                              ),
                              CustomSpace(width: AppSizes.size10),
                              Expanded(
                                flex: 2,
                                child: CustomElevatedButton(
                                  label: "Entrar",
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();

                                    if (_formKey.currentState!.validate()) {
                                      await blocProvider(context).signIn(
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
                              await blocProvider(context).googleSignIn(),
                          // await authController.googleSignIn(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
