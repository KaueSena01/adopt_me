import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
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
              title: 'Configurações',
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.size15),
              child: Column(),
            ),
          ],
        ),
      ),
    );
  }
}
