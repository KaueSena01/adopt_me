import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/presentation/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget appBar(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: AppSizes.size60),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Get.to(const LogInPage()),
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
