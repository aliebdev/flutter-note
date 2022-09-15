import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routes/app_pages.dart';
import 'core/utils/utils.dart';
import 'features/note/presentation/controllers/setting_controller.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final controller = Get.put(SettingController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Note',
      translations: Localization(),
      locale: controller.locale,
      fallbackLocale: const Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.circularReveal,
      transitionDuration: pageTransitionDuration,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: controller.themeMode,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.pages,
      builder: (context, child) {
        return Theme(
          data: controller.isDarkMode.value
              ? AppTheme.dark.copyWith(
                  textTheme: controller.currentLocale.value == "fa"
                      ? FarsiTypography.textTheme.apply(
                          bodyColor: controller.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                        )
                      : GoogleFonts.montserratTextTheme().apply(
                          bodyColor: controller.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                        ),
                )
              : AppTheme.light.copyWith(
                  textTheme: controller.currentLocale.value == "fa"
                      ? FarsiTypography.textTheme.apply(
                          bodyColor: controller.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                        )
                      : GoogleFonts.montserratTextTheme().apply(
                          bodyColor: controller.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          displayColor: controller.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                        ),
                ),
          child: child!,
        );
      },
    );
  }
}
