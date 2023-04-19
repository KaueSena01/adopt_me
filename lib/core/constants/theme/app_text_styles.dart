import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextTheme textTheme = TextTheme(
    // display
    displayLarge: TextStyle(
      fontSize: FontSize.fontSize28,
      fontWeight: FontWeight.w700,
      fontFamily: 'Inter',
    ),
    displayMedium: TextStyle(
      fontSize: FontSize.fontSize28,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
    ),
    displaySmall: TextStyle(
      fontSize: FontSize.fontSize28,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
    ),
    // title
    titleLarge: TextStyle(
      fontSize: FontSize.fontSize24,
      fontWeight: FontWeight.w700,
      fontFamily: 'Inter',
    ),
    titleMedium: TextStyle(
      fontSize: FontSize.fontSize24,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
    ),
    titleSmall: TextStyle(
      fontSize: FontSize.fontSize24,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
    ),
    // body
    bodyLarge: TextStyle(
      fontSize: FontSize.fontSize20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Inter',
    ),
    bodyMedium: TextStyle(
      fontSize: FontSize.fontSize20,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
    ),
    bodySmall: TextStyle(
      fontSize: FontSize.fontSize20,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
    ),
    // label
    labelLarge: TextStyle(
      fontSize: FontSize.fontSize16,
      fontWeight: FontWeight.w700,
      fontFamily: 'Inter',
    ),
    labelMedium: TextStyle(
      fontSize: FontSize.fontSize16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
    ),
    labelSmall: TextStyle(
      fontSize: FontSize.fontSize16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
    ),
    // headline
    headlineLarge: TextStyle(
      fontSize: FontSize.fontSize14,
      fontWeight: FontWeight.w700,
      fontFamily: 'Inter',
    ),
    headlineMedium: TextStyle(
      fontSize: FontSize.fontSize14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
    ),
    headlineSmall: TextStyle(
      fontSize: FontSize.fontSize14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
    ),
  );
}
