import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/local_storage_provider.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/strings.dart';

class SettingController extends GetxController {
  late RxBool isDarkMode = true.obs;
  late RxString currentLocale = "".obs;

  ThemeMode get themeMode =>
      _getIsDarkMode() ? ThemeMode.dark : ThemeMode.light;

  Locale get locale => _getLocale() == "fa" ? fa : us;

  final settings = ["change_theme".tr, "change_language".tr];

  @override
  void onInit() {
    isDarkMode.value = _getIsDarkMode();
    currentLocale.value = _getLocale();
    super.onInit();
  }

  void toggleTheme() {
    changeTheme(!isDarkMode.value);
    final mode = isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(mode);
  }

  void toggleLocale() {
    changeLocale(currentLocale.value == "fa" ? "us" : "fa");
    final locale = currentLocale.value == "fa" ? fa : us;
    Get.updateLocale(locale);
  }

  void changeTheme(bool value) async {
    isDarkMode.value = value;
    await LocalStorageProvider().write(AppStrings.isDark, value);
    Get.changeThemeMode(themeMode);
    print("isDarkMode = $isDarkMode");
  }

  void changeLocale(String value) async {
    currentLocale.value = value;
    await LocalStorageProvider().write(AppStrings.locale, value);
    print("locale = $currentLocale");
  }

  bool _getIsDarkMode() {
    try {
      return LocalStorageProvider().read(AppStrings.isDark);
    } catch (e) {
      return Get.isDarkMode;
    }
  }

  String _getLocale() {
    try {
      return LocalStorageProvider().read(AppStrings.locale);
    } catch (e) {
      return "fa";
    }
  }
}
