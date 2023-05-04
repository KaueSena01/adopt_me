import 'package:flutter/material.dart';

import 'package:adopt_me/core/constants/theme/app_colors.dart';

Widget background(BuildContext context, Widget child) {
  final size = MediaQuery.of(context).size;

  return Container(
    width: size.width,
    height: size.height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primaryColor,
          AppColors.blackColor,
        ],
      ),
    ),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              const SizedBox(
                height: 200,
                width: 200,
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Image.asset(
                  "assets/images/login_background_2.png",
                  height: 150,
                ),
              ),
              Positioned(
                right: 0,
                top: 50,
                child: Image.asset(
                  "assets/images/login_background_1.png",
                  height: 250,
                ),
              ),
            ],
          ),
        ),
        Positioned(child: child),
      ],
    ),
  );
}
