import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/core/routes/app_routes.dart';
import 'package:simple_hive_note/features/note/domain/entities/note_entity.dart';
import 'package:simple_hive_note/features/note/presentation/controllers/setting_controller.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../controllers/note_controller.dart';
import '../../../domain/entities/todo_entity.dart';

class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({Key? key}) : super(key: key);

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  @override
  void initState() {
    super.initState();

    _getNote();
  }

  _getNote() {
    final NoteController controller = Get.find<NoteController>();
    final String noteId = Get.arguments as String;
    controller.fetchNote(noteId);
  }

  @override
  Widget build(BuildContext context) {
    final settingController = Get.find<SettingController>();
    return GetBuilder<NoteController>(
      id: "note_detail",
      builder: (controller) {
        return controller.note == null
            ? Scaffold(
                appBar: const NoteAppbar(),
                body: ErrorText(message: controller.error ?? ""),
              )
            : Scaffold(
                backgroundColor: controller.note!.color ?? colors.randomElement,
                appBar: NoteAppbar(
                  actions: [
                    ActionButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.addUpdate,
                            arguments: controller.note!);
                      },
                      child: const Icon(Icons.edit),
                    ),
                    ActionButton(
                      onPressed: () {
                        controller.delete(controller.note!.id!);
                        Get.back();
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacings.l,
                      vertical: AppSpacings.s,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SelectableText(
                          controller.note!.title ?? "",
                          style: AppTextStyle.title,
                        ),
                        const SizedBox(height: AppSpacings.l),
                        SelectableText(
                          settingController.currentLocale.value == "fa"
                              ? controller.note!.dateTime!.jalaliDateWithTime
                              : controller.note!.dateWithTime,
                          style: AppTextStyle.date,
                        ),
                        const SizedBox(height: AppSpacings.xxl),
                        if (controller.note!.hasTodo) ...{
                          _BuildTodoList(note: controller.note!),
                          const SizedBox(height: AppSpacings.xxl),
                        },
                        SelectableText(
                          controller.note!.description ?? "",
                          style: AppTextStyle.description,
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class _BuildTodoList extends StatelessWidget {
  const _BuildTodoList({Key? key, required this.note}) : super(key: key);

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "todo_title".tr,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        ListView.builder(
          itemCount: note.todos.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final todo = note.todos[index];
            return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              dense: true,
              value: todo.isCompleted,
              title: Text(
                todo.title ?? "",
                style: TextStyle(
                  fontSize: 18,
                  decoration:
                      todo.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
              onChanged: (value) {
                final controller = Get.find<NoteController>();
                controller.toggleTodoIsCompleted(todo.id!);
              },
            );
          },
        ),
      ],
    );
  }
}
