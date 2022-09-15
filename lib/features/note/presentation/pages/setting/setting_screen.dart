// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/features/note/presentation/controllers/setting_controller.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppbar(
        title: "settings".tr,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "change_theme".tr,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            leading: Icon(Icons.dark_mode_rounded),
            minLeadingWidth: 20,
            onTap: () => controller.toggleTheme(),
            trailing: Obx(
              () => Text(
                controller.isDarkMode.value
                    ? "theme_dark".tr
                    : "theme_light".tr,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "change_language".tr,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            leading: Icon(Icons.language),
            minLeadingWidth: 20,
            onTap: () => controller.toggleLocale(),
            trailing: Obx(
              () => Text(
                controller.currentLocale.value == "fa"
                    ? "persian".tr
                    : "english".tr,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      // margin: EdgeInsets.all(AppSpacings.xl),
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(AppSpacings.l),
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        trailing: SizedBox.shrink(),
        children: children,
      ),
    );
    //   return InkWell(
    //     child: Container(
    //       padding: const EdgeInsets.all(AppSpacings.xl),
    //       child: Row(
    //         children: [
    //           Icon(setting.icon),
    //           const SizedBox(width: AppSpacings.m),
    //           Text(
    //             setting.title,
    //             style: const TextStyle(
    //               fontSize: 20,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
