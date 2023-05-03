import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/validators/input_validator.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_cubit.dart';
import 'package:adopt_me/layers/presentation/pages/user/widgets/user_profile.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_connection_state_done_widget.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_elevated_button.dart';
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

  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;
  TextEditingController? _aboutMeController;

  final _formKey = GlobalKey<FormState>();
  bool _isFormDirty = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: blocProvider(context).getCurrentUser(),
      builder: (context, snapshot) {
        return CustomConnectionStateDoneWidget(
          snapshot: snapshot,
          builder: (context, snapshot) {
            UserEntity userEntity = blocProvider(context).userEntity!;
            return Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          UserProfile(userEntity: userEntity),
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
                                    initialValue: userEntity.name,
                                    labelTextColor: AppColors.silverColor,
                                    inputTextColor: AppColors.darkColor,
                                    darkBorder: true,
                                    // controller: _nameController,
                                    textInputType: TextInputType.name,
                                    validator: nameValidator,
                                  ),
                                  CustomTextField(
                                    margin: EdgeInsets.only(
                                      top: AppSizes.size20,
                                      bottom: AppSizes.size15,
                                    ),
                                    labelText: "E-mail",
                                    hintText: "Seu nome",
                                    initialValue: userEntity.email,
                                    labelTextColor: AppColors.silverColor,
                                    inputTextColor: AppColors.darkColor,
                                    darkBorder: true,
                                    // controller: _emailController,
                                    textInputType: TextInputType.emailAddress,
                                    validator: emailValidator,
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
                                    // controller: _phoneController,
                                    textInputType: TextInputType.number,
                                    // validator: phoneValidator,
                                  ),
                                  CustomTextField(
                                    margin: EdgeInsets.only(
                                      top: AppSizes.size20,
                                      bottom: AppSizes.size15,
                                    ),
                                    labelText: "Sobre",
                                    hintText: "Sobre você",
                                    initialValue: userEntity.aboutMe,
                                    labelTextColor: AppColors.silverColor,
                                    inputTextColor: AppColors.darkColor,
                                    maxLines: 3,
                                    darkBorder: true,
                                    // controller: _aboutMeController,
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
                    onPressed: _isFormDirty
                        ? () async {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              await blocProvider(context).updateUser(
                                _nameController!.text,
                                _emailController!.text,
                                _phoneController!.text,
                                _aboutMeController!.text,
                              );
                            }
                          }
                        : null,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
