import 'dart:io';
import 'dart:ui';

import 'package:adopt_me/core/constants/router/app_routes.dart';
import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/functions/navigator.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_cubit.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_app_bar.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    Key? key,
    required this.file,
  }) : super(key: key);

  final File file;
  final blocProvider = BlocProvider.of<UserCubit>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: AppSizes.size10,
                sigmaY: AppSizes.size10,
              ),
              child: Container(
                color: AppColors.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                CustomSpace(height: AppSizes.size50),
                CustomAppBar(
                  padding: EdgeInsets.all(AppSizes.size10),
                  title: "Foto do perfil",
                  color: AppColors.whiteColor,
                  onPressed: () => navigatePop(context),
                ),
                Expanded(
                  child: Center(
                    child: ClipOval(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.width * 0.6,
                        child: Image.file(
                          file,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomElevatedButton(
                  margin: EdgeInsets.all(AppSizes.size20),
                  label: "Atualizar",
                  onPressed: () {
                    blocProvider(context).updateProfilePic(file.path);
                    navigateAndRemove(context, AppRoutes.editProfileRoute);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
