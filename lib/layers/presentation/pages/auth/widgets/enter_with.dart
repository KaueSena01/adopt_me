import 'package:flutter/material.dart';

import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_space.dart';

Widget enterWith(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Container(
    margin: EdgeInsets.only(
      top: AppSizes.size40,
      bottom: AppSizes.size40,
    ),
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            width: size.width,
            color: AppColors.lighterColor,
          ),
        ),
        CustomSpace(width: AppSizes.size20),
        Expanded(
          child: Text(
            "ou entrar com",
            style: AppTextStyles.textTheme.headlineSmall!.apply(
              color: AppColors.lighterColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        CustomSpace(width: AppSizes.size20),
        Expanded(
          child: Container(
            height: 1,
            width: size.width,
            color: AppColors.lighterColor,
          ),
        ),
      ],
    ),
  );
}
