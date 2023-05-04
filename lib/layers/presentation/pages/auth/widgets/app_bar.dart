import 'package:adopt_me/core/constants/router/app_routes.dart';
import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/core/functions/navigator.dart';
import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: AppSizes.size60),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => navigateAndRemove(context, AppRoutes.loginRoute),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.whiteColor,
            size: AppSizes.size20,
          ),
        ),
        Text(
          "Criar conta",
          style: AppTextStyles.textTheme.bodyMedium!.apply(
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(
          height: AppSizes.size50,
          width: AppSizes.size50,
        ),
      ],
    ),
  );
}
