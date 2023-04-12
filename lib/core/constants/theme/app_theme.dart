import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';

abstract class AppTheme {
  static const MaterialColor _primarySwatch = MaterialColor(0xFFE9913B, {
    50: Color(0xFFE9913B),
    100: Color(0xFFE9913B),
    200: Color(0xFFE9913B),
    300: Color(0xFFE9913B),
    400: Color(0xFFE9913B),
    500: Color(0xFFE9913B),
    600: Color(0xFFE9913B),
    700: Color(0xFFE9913B),
    800: Color(0xFFE9913B),
    900: Color(0xFFE9913B),
  });

  static final ThemeData themeData = ThemeData(
    primarySwatch: _primarySwatch,
    primaryColor: const Color(0xFFE9913B),
    scaffoldBackgroundColor: AppColors.primaryColor,
    textTheme: AppTextStyles.textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(BorderRadiusSize.borderRadiusMedium),
          ),
        ),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.primaryColor200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(BorderRadiusSize.borderRadiusMedium),
          ),
        ),
        side: BorderSide(
          width: BorderSize.borderSizeSmall,
          color: AppColors.primaryColor,
          style: BorderStyle.solid,
        ),
      ),
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(),
    brightness: Brightness.light,
    canvasColor: AppColors.primaryColor,
    // scaffoldBackgroundColor: lightColor,
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.all(0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const UnderlineInputBorder(),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.whiteColor,
          width: BorderSize.borderSizeSmall,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.whiteColor,
          width: BorderSize.borderSizeSmall,
        ),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          // color: labelColor,
          width: 2,
        ),
      ),
      errorStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        fontFamily: 'Poppins',
        // color: labelColor,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      // secondary: secondaryColor,
      // tertiary: tertiaryColor,
      // background: colorScheme.background,
      // ).copyWith(error: labelColor),
    ),
  );
}
