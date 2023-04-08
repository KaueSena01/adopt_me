import 'package:flutter/material.dart';

import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.iconPath,
    this.textStyle,
    this.width,
    this.height,
  });

  final String label;
  final String? iconPath;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? AppSizes.size55,
      child: OutlinedButton(
        onPressed: onPressed,
        child: iconPath != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: AppSizes.size05),
                    height: AppSizes.size25,
                    width: AppSizes.size25,
                    child: SvgPicture.asset(
                      iconPath!,
                    ),
                  ),
                  Text(
                    label,
                    style: textStyle ??
                        AppTextStyles.textTheme.headlineSmall!.apply(
                          color: AppColors.whiteColor,
                        ),
                  ),
                ],
              )
            : Text(
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
