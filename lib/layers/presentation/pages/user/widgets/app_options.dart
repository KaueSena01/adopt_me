import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class AppOptions extends StatelessWidget {
  const AppOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizes.size40),
      child: Column(
        children: [
          option(
            title: 'Tema',
            description: "Modo escuro",
            icon: Icons.mode_night_rounded,
          ),
          CustomSpace(
            height: AppSizes.size40,
          ),
          option(
            title: 'Notificações',
            description: "Notificação",
            icon: Icons.notifications,
          ),
          CustomSpace(
            height: AppSizes.size40,
          ),
          option(
            title: 'Mais configurações',
            description: "linguagem",
            isSwitch: false,
            icon: Icons.language,
          ),
          option(
            title: '',
            description: "Sair",
            isSwitch: false,
            icon: Icons.arrow_back,
            iconColor: AppColors.dangerColor,
            backgroundColor: AppColors.lightPinkColor,
          ),
        ],
      ),
    );
  }
}

Widget option({
  required String title,
  required String description,
  required IconData icon,
  Color? iconColor,
  Color? backgroundColor,
  bool isSwitch = true,
  void Function(bool)? onChanged,
  void Function()? onPressed,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        title,
        style: AppTextStyles.textTheme.labelMedium!.apply(
          color: AppColors.defaultColor,
        ),
      ),
      Row(
        children: [
          Container(
            height: AppSizes.size40,
            width: AppSizes.size40,
            margin: EdgeInsets.only(right: AppSizes.size20),
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.primaryColor,
              borderRadius: BorderRadius.circular(AppSizes.size50),
            ),
            child: Icon(
              icon,
              color: iconColor ?? AppColors.whiteColor,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  description,
                  style: AppTextStyles.textTheme.labelMedium,
                ),
                if (isSwitch)
                  Switch(
                    value: false,
                    inactiveThumbColor: AppColors.aquaBlueColor,
                    inactiveTrackColor: AppColors.cardColor,
                    onChanged: onChanged,
                  )
                else
                  Padding(
                    padding: EdgeInsets.only(right: AppSizes.size05),
                    child: GestureDetector(
                      onTap: onPressed,
                      child: const Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  )
              ],
            ),
          ),
        ],
      )
    ],
  );
}
