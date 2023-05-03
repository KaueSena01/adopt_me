import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onPressed,
    this.color,
    this.padding,
  });

  final String title;
  final Color? color;
  final void Function() onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: AppSizes.size60,
            horizontal: AppSizes.size05,
          ),
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_back_ios,
              color: color ?? AppColors.darkColor,
              size: AppSizes.size20,
            ),
          ),
          Text(
            title,
            style: AppTextStyles.textTheme.bodyMedium!.apply(
              color: color ?? AppColors.darkColor,
            ),
          ),
        ],
      ),
    );
  }
}
