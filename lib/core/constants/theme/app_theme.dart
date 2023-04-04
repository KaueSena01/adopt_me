import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  //
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
    textTheme: AppTextStyles.textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(AppSizes.size20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(BorderRadiusSize.borderRadiusLarge),
          ),
        ),
      ),
    ),
  );
}
