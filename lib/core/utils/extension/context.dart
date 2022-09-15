import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/core/utils/theme/colors.dart';

extension ContextEx on BuildContext {
  void showMessage(String message, {bool isError = false}) {
    final snackBar = GetSnackBar(
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? AppColors.error : AppColors.primary,
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    Get.showSnackbar(snackBar);
  }
}
