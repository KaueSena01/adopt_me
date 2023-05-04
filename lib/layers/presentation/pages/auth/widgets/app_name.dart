import 'package:flutter/material.dart';

import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';

Widget appName(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: AppSizes.size60),
    child: Text.rich(
      textAlign: TextAlign.center,
      style: AppTextStyles.textTheme.titleSmall!.apply(
        color: AppColors.whiteColor,
      ),
      TextSpan(
        children: [
          const TextSpan(
            text: 'Bem vindo a\n',
          ),
          TextSpan(
            text: 'ADOPT ME',
            style: AppTextStyles.textTheme.titleLarge,
          ),
        ],
      ),
    ),
  );
}
