import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/core/utils/utils.dart';
import 'package:simple_hive_note/features/note/presentation/controllers/setting_controller.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/note_entity.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
    this.selected = false,
    this.onSelect,
    this.onTap,
  }) : super(key: key);

  final NoteEntity note;
  final bool selected;
  final Function()? onSelect;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final settingController = Get.find<SettingController>();
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppSpacings.m),
      color: note.color ?? const Color(0xff5C4F45),
      child: InkWell(
        splashColor: Colors.black12,
        onLongPress: onSelect,
        onTap: onTap,
        child: Container(
          // constraints: const BoxConstraints(
          //   maxHeight: 300,
          //   minHeight: 100,
          // ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacings.l,
            vertical: AppSpacings.l,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      note.title ?? '',
                      presetFontSizes: const [16, 14, 12, 10, 8],
                      textScaleFactor: 2,
                      softWrap: true,
                      style: AppTextStyle.title,
                      group: AutoSizeGroup(),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const SizedBox(height: AppSpacings.m),
                  Text(
                    settingController.currentLocale.value == "fa"
                        ? note.dateTime!.jalaliDate
                        : note.date,
                    style: AppTextStyle.date,
                  ),
                ],
              ),
              if (selected)
                Align(
                  alignment: Alignment.topLeft,
                  heightFactor: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 20,
                          color: note.color ?? AppColors.primary,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacings.m),
                      child: Icon(
                        Icons.check,
                        color: note.color,
                        size: 20,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
