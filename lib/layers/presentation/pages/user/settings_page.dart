import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/layers/presentation/pages/user/widgets/app_options.dart';
import 'package:adopt_me/layers/presentation/pages/user/widgets/card_user.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
              title: 'Configurações',
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.size15),
              child: Column(
                children: const [
                  CardUser(),
                  AppOptions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
