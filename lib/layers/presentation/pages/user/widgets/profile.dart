import 'dart:io';

import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/presentation/pages/user/preview_page.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_outlined_button.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_space.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              child: widget.imageUrl != ""
                  ? Image.network(
                      widget.imageUrl,
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
                onTap: () {
                  editProfilePicture();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void editProfilePicture() async {
    preview(file) async {
      File preview;

      file = await Get.to(() => PreviewPage(file: file));

      if (file != null) {
        setState(() => preview = file);
        Get.back();
      }
    }

    Get.bottomSheet(
      Container(
        height: 285,
        padding: EdgeInsets.all(AppSizes.size30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.size30),
            topRight: Radius.circular(AppSizes.size30),
          ),
          color: AppColors.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Foto do perfil",
                    style: AppTextStyles.textTheme.bodyMedium!
                        .apply(color: AppColors.darkColor),
                  ),
                  CustomSpace(height: AppSizes.size40),
                  CustomOutlinedButton(
                    label: "Tire uma foto",
                    backgroundColor: AppColors.cardColor,
                    textStyle: AppTextStyles.textTheme.labelSmall!.apply(
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () => Get.to(
                      () => CameraCamera(
                        resolutionPreset: ResolutionPreset.max,
                        onFile: (file) => preview(file),
                      ),
                    ),
                  ),
                  CustomSpace(height: AppSizes.size25),
                  CustomOutlinedButton(
                    label: "Selecionar da galeria",
                    backgroundColor: AppColors.cardColor,
                    textStyle: AppTextStyles.textTheme.labelSmall!.apply(
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
