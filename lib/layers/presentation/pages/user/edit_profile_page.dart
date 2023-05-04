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
  const EditProfilePage({
    super.key,
    // required this.userEntity,
  });

  // final UserEntity userEntity;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final blocProvider = BlocProvider.of<UserCubit>;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _aboutMeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final bool _isFormDirty = true; // false

  @override
  void initState() {
    super.initState();
    // _nameController.text = widget.userEntity.name;
    // _emailController.text = widget.userEntity.email;
    // _phoneController.text = widget.userEntity.phone;
    // _aboutMeController.text = widget.userEntity.aboutMe;
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
            _nameController.text = userEntity.name;
            _emailController.text = userEntity.email;
            _phoneController.text = userEntity.phone;
            _aboutMeController.text = userEntity.aboutMe;
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
                                // setState(() {
                                //   _isFormDirty = true;
                                // });
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
                                    labelTextColor: AppColors.silverColor,
                                    inputTextColor: AppColors.darkColor,
                                    darkBorder: true,
                                    controller: _nameController,
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
                                    labelTextColor: AppColors.silverColor,
                                    inputTextColor: AppColors.darkColor,
                                    darkBorder: true,
                                    controller: _emailController,
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
                                    labelTextColor: AppColors.silverColor,
                                    inputTextColor: AppColors.darkColor,
                                    darkBorder: true,
                                    controller: _phoneController,
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
                                    labelTextColor: AppColors.silverColor,
                                    inputTextColor: AppColors.darkColor,
                                    maxLines: 3,
                                    darkBorder: true,
                                    controller: _aboutMeController,
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
                                _nameController.text,
                                _emailController.text,
                                _phoneController.text,
                                _aboutMeController.text,
                                userEntity.location,
                                userEntity.profileUrl,
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
