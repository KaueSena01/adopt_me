import 'dart:io';
import 'package:get/get.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_cubit.dart';
import 'package:adopt_me/layers/presentation/pages/user/preview_page.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_image_selection_widget.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_space.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    super.key,
    required this.userEntity,
  });

  final UserEntity userEntity;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: AppSizes.size150,
          width: double.infinity,
          color: AppColors.primaryColor,
        ),
        Positioned(
          bottom: -AppSizes.size40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                child: Container(
                  height: AppSizes.size100,
                  width: AppSizes.size100,
                  margin: EdgeInsets.fromLTRB(
                    AppSizes.size15,
                    AppSizes.size15,
                    AppSizes.size20,
                    AppSizes.size15,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    border: widget.userEntity.profileUrl.isEmpty
                        ? Border.all(
                            color: AppColors.whiteColor,
                            width: BorderSize.borderSizeMedium,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(AppSizes.size60),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: AppSizes.size100,
                        width: AppSizes.size100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppSizes.size100),
                          child: widget.userEntity.profileUrl != ""
                              ? Image.network(
                                  widget.userEntity.profileUrl,
                                  fit: BoxFit.cover,
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
                        left: AppSizes.size70,
                        child: Container(
                          height: AppSizes.size35,
                          width: AppSizes.size35,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: BorderSize.borderSizeMedium,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          child: Icon(
                            Icons.edit_sharp,
                            color: AppColors.whiteColor,
                            size: AppSizes.size20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () async => editProfilePicture(context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSpace(height: AppSizes.size35),
                  Text(
                    widget.userEntity.name,
                    style: AppTextStyles.textTheme.bodyMedium!.apply(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  CustomSpace(height: AppSizes.size00),
                  Text(
                    widget.userEntity.location,
                    style: AppTextStyles.textTheme.headlineSmall!.apply(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void editProfilePicture(BuildContext context) {
    const blocProvider = BlocProvider.of<UserCubit>;
    File preview;

    takePicture() async {
      Get.to(
        () => CameraCamera(
          resolutionPreset: ResolutionPreset.max,
          onFile: (file) async {
            await Get.to(() => PreviewPage(file: file));
            setState(() => preview = file);
            Get.back();
          },
        ),
      );
    }

    getFileFromGallery(context) async {
      ImagePicker image = ImagePicker();

      final file = await image.pickImage(source: ImageSource.gallery);
      blocProvider(context).updateProfilePic(file!.path);

      setState(() => preview = File(file.path));
    }

    removePicture(context) {
      blocProvider(context).updateProfilePic("");
    }

    Get.bottomSheet(
      Container(
        height: AppSizes.size210,
        padding: EdgeInsets.fromLTRB(
          AppSizes.size25,
          AppSizes.size25,
          AppSizes.size25,
          AppSizes.size00,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.size25),
            topRight: Radius.circular(AppSizes.size25),
          ),
          color: AppColors.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Foto do perfil",
                    style: AppTextStyles.textTheme.bodyMedium!
                        .apply(color: AppColors.darkColor),
                  ),
                  Text(
                    "Selecione uma foto para seu perfil",
                    style: AppTextStyles.textTheme.headlineSmall!
                        .apply(color: AppColors.darkColor),
                  ),
                  CustomSpace(height: AppSizes.size40),
                  Row(
                    children: [
                      CustomImageSelectionWidget(
                        label: "Câmera",
                        icon: Icons.camera_alt,
                        onTap: () => takePicture(),
                      ),
                      CustomImageSelectionWidget(
                        label: "Galeria",
                        icon: Icons.photo,
                        onTap: () => getFileFromGallery(context),
                      ),
                      CustomImageSelectionWidget(
                        label: "Remover",
                        icon: Icons.delete,
                        onTap: () => removePicture(context),
                      ),
                    ],
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
