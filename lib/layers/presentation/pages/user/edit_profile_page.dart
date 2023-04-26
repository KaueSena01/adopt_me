import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_cubit.dart';
import 'package:adopt_me/layers/presentation/pages/user/widgets/profile.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_app_bar.dart';
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
              padding: EdgeInsets.symmetric(horizontal: AppSizes.size15),
              child: Expanded(
                child: Form(
                  key: _formKey,
                  onChanged: () {
                    setState(() {
                      _isFormDirty = true;
                    });
                  },
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
      ),
    );
  }
}
