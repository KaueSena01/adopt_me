import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_cubit.dart';
import 'package:adopt_me/layers/presentation/pages/user/widgets/profile.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_space.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final blocProvider = BlocProvider.of<UserCubit>;

  final _formKey = GlobalKey<FormState>();
  bool _isFormDirty = false;

  late UserEntity user;

  @override
  void initState() {
    super.initState();
    _requestUser(context);
  }

  void _requestUser(BuildContext context) async {
    await blocProvider(context).getCurrentUser();
    setState(() {
      user = blocProvider(context).userEntity!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        color: AppColors.primaryColor,
                      ),
                      Positioned(
                        bottom: -40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Profile(imageUrl: user.profileUrl),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSpace(height: AppSizes.size35),
                                Text(
                                  user.name,
                                  style:
                                      AppTextStyles.textTheme.bodyMedium!.apply(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                CustomSpace(height: AppSizes.noSize),
                                Text(
                                  user.location,
                                  style: AppTextStyles.textTheme.headlineSmall!
                                      .apply(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppSizes.size15,
                      AppSizes.size45,
                      AppSizes.size15,
                      AppSizes.size20,
                    ),
                    child: Form(
                      key: _formKey,
                      onChanged: () {
                        setState(() {
                          _isFormDirty = true;
                        });
                      },
                      child: Column(
                        children: [
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
                            darkBorder: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomElevatedButton(
            label: "Atualizar",
            margin: EdgeInsets.symmetric(
              vertical: AppSizes.size40,
              horizontal: AppSizes.size15,
            ),
            onPressed: _isFormDirty ? () {} : null,
          ),
        ],
      ),
    );
  }
}
