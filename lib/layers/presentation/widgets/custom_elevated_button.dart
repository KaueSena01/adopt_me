import 'package:flutter/material.dart';

import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textStyle,
    this.width,
    this.height,
  });

  final String label;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? AppSizes.size55,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: textStyle ??
              AppTextStyles.textTheme.headlineSmall!.apply(
                color: AppColors.whiteColor,
              ),
        ),
      ),
    );
  }
}
