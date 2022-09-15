import 'package:flutter/material.dart';

class AppTextStyle {
  const AppTextStyle._();

  static const title = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  static const description = TextStyle(
    fontSize: 20,
  );

  static const date = TextStyle(
    fontSize: 15,
    color: Colors.white60,
  );
}

class FarsiTypography {
  static TextTheme get textTheme => const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 30,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 24,
          // fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
        ),
      ).apply(fontFamily: "IRANSans");
}
