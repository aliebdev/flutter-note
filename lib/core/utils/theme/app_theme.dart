import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData dark = ThemeData.dark().copyWith(
    // scaffoldBackgroundColor: AppColors.scaffoldBackground,
    // colorScheme: ColorScheme.fromSwatch().copyWith(
    //   primary: AppColors.primary,
    //   secondary: AppColors.secondary,
    // ),
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    primaryColorDark: Colors.black,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    ),
  );

  static ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    brightness: Brightness.light,
    primaryColorLight: Colors.white,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    ),
  );
}
