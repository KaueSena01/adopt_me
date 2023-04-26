import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_cubit.dart';
import 'package:adopt_me/layers/presentation/pages/user/widgets/profile.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_app_bar.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_connection_state_done_widget.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  final blocProvider = BlocProvider.of<UserCubit>;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: blocProvider(context).getCurrentUser(),
      builder: (context, snapshot) {
        UserEntity user = blocProvider(context).userEntity!;
        return CustomConnectionStateDoneWidget(
          snapshot: snapshot,
          builder: (context, snapshot) {
            return Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                      padding: EdgeInsets.fromLTRB(
                        AppSizes.size05,
                        AppSizes.size60,
                        AppSizes.size05,
                        AppSizes.size30,
                      ),
                      title: 'Editar perfil',
                      onPressed: () {},
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.size15),
                      child: Expanded(
                        child: Column(
                          children: [
                            Profile(imageUrl: user.profileUrl),
                            CustomTextField(
                              margin: EdgeInsets.only(
                                top: AppSizes.size20,
                                bottom: AppSizes.size15,
                              ),
                              labelText: "Nome",
                              hintText: "Seu nome",
                              initialValue: user.name,
                              labelTextColor: AppColors.silverColor,
                              inputTextColor: AppColors.darkColor,
                              readOnly: true,
                              darkBorder: true,
                            ),
                            CustomTextField(
                              margin: EdgeInsets.only(
                                top: AppSizes.size20,
                                bottom: AppSizes.size15,
                              ),
                              labelText: "E-mail",
                              hintText: "Seu nome",
                              initialValue: user.email,
                              labelTextColor: AppColors.silverColor,
                              inputTextColor: AppColors.darkColor,
                              readOnly: true,
                              darkBorder: true,
                            ),
                            CustomTextField(
                              margin: EdgeInsets.only(
                                top: AppSizes.size20,
                                bottom: AppSizes.size15,
                              ),
                              labelText: "Telefone",
                              hintText: "Seu telefone",
                              initialValue: "+55 88 99123-4567",
                              labelTextColor: AppColors.silverColor,
                              inputTextColor: AppColors.darkColor,
                              readOnly: true,
                              darkBorder: true,
                            ),
                            CustomTextField(
                              margin: EdgeInsets.only(
                                top: AppSizes.size20,
                                bottom: AppSizes.size15,
                              ),
                              labelText: "Sobre",
                              hintText: "Sobre você",
                              initialValue: user.aboutMe,
                              labelTextColor: AppColors.silverColor,
                              inputTextColor: AppColors.darkColor,
                              maxLines: 3,
                              readOnly: true,
                              darkBorder: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      label: "Atualizar",
                      margin: EdgeInsets.symmetric(
                        vertical: AppSizes.size20,
                        horizontal: AppSizes.size15,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
