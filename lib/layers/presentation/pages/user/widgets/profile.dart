import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.size120,
      width: AppSizes.size120,
      margin: EdgeInsets.all(AppSizes.size20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(AppSizes.size60),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: AppSizes.size120,
            width: AppSizes.size120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.size100),
              child: imageUrl != ""
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                      height: AppSizes.size40,
                      width: AppSizes.size40,
                    )
                  : Padding(
                      padding: EdgeInsets.all(AppSizes.size15),
                      child: SvgPicture.asset(
                        "assets/icons/person.svg",
                        color: AppColors.whiteColor,
                      ),
                    ),
            ),
          ),
          Positioned(
            bottom: AppSizes.size05,
            right: AppSizes.noSize,
            child: Container(
              height: AppSizes.size40,
              width: AppSizes.size40,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: BorderSize.borderSizeMedium,
                  color: AppColors.whiteColor,
                ),
              ),
              child: GestureDetector(
                child: Icon(
                  Icons.edit_sharp,
                  color: AppColors.whiteColor,
                ),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
