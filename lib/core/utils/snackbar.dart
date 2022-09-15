import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/core/utils/theme/colors.dart';

class AppSnackbar {
  const AppSnackbar._();

  static showSnackbar(String message, {bool isError = false}) {
    final snackBar = GetSnackBar(
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: isError ? AppColors.error : AppColors.primary,
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
    Get.showSnackbar(snackBar);
  }
}
