import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.size90,
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.size10),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadiusMedium,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: AppSizes.size50,
            width: AppSizes.size50,
            margin: EdgeInsets.only(right: AppSizes.size15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: BorderSize.borderSizeLarge,
                color: AppColors.primaryColor,
              ),
              color: AppColors.cardColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.size100),
              child: Image.network(
                "https://avatars.githubusercontent.com/u/86299739?s=400&u=79241537628ffd14ff1f80a584669a9b491e7bc1&v=4",
                fit: BoxFit.fill,
                height: AppSizes.size40,
                width: AppSizes.size40,
              ),
              // SvgPicture.asset(
              //   "assets/icons/person.svg",
              //   color: AppColors.whiteColor,
              // ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.name,
                      style: AppTextStyles.textTheme.labelLarge,
                    ),
                    Text(
                      "Perfil",
                      style: AppTextStyles.textTheme.labelSmall!.apply(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  user.email,
                  style: AppTextStyles.textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
