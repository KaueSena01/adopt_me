import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class CustomImageSelectionWidget extends StatelessWidget {
  const CustomImageSelectionWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: AppSizes.size30,
        bottom: AppSizes.size10,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              height: AppSizes.size55,
              width: AppSizes.size55,
              child: Container(
                padding: EdgeInsets.all(AppSizes.size05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.size100),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: BorderSize.borderSizeSmall,
                  ),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primaryColor,
                  size: AppSizes.size30,
                  weight: 1,
                ),
              ),
            ),
          ),
          CustomSpace(height: AppSizes.size10),
          Text(
            label,
            style: AppTextStyles.textTheme.headlineSmall!.apply(
              color: AppColors.defaultColor,
            ),
          ),
        ],
      ),
    );
  }
}
