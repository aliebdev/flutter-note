import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_hive_note/core/routes/app_routes.dart';

import '../../../../../core/data/database_provider.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../controllers/note_controller.dart';
import '../../widgets/note_screen/note_card.dart';

class NoteScreen extends GetView<NoteController> {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppbar(
        title: "notes".tr,
        autoImplementLeading: false,
        actions: [
          GetBuilder<NoteController>(
            id: 'note_actions',
            builder: (controller) => controller.selectedIds.isEmpty
                ? ActionButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.note + AppRoutes.setting);
                    },
                    child: const Icon(Icons.settings),
                  )
                : Row(
                    children: [
                      ActionButton(
                        onPressed: () async {
                          await controller.deleteMultiNotes();
                          // context.showMessage(
                          //     "${controller.selectedIds.length} ${"delete_msg".tr}");
                        },
                        child: Row(
                          children: [
                            Text(
                              "${"delete".tr} - ${controller.selectedIds.length}",
                              // style: const TextStyle(
                              //   color: Colors.white,
                              // ),
                              style: Get.theme.textTheme.bodyMedium,
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.delete),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacings.l),
                      ActionButton(
                        onPressed: controller.cancelDeleting,
                        child: const Icon(Icons.close_rounded),
                      ),
                    ],
                  ),
          ),
        ],
      ),
      floatingActionButton: FadeInUp(
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.addUpdate);
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: DatabaseProvider().box.listenable(),
        builder: (BuildContext context, _, Widget? child) {
          controller.fetchAllNotes();
          return child!;
        },
        child: GetBuilder<NoteController>(
          id: "note_list",
          // builder: (controller) => _BuildNotesList(controller: controller),
          builder: (controller) => controller.isErrorNotEmpty()
              ? ErrorText(message: controller.error ?? "")
              : _BuildNotesList(controller: controller),
        ),
      ),
    );
  }
}

class _BuildNotesList extends StatelessWidget {
  const _BuildNotesList({Key? key, required this.controller}) : super(key: key);

  final NoteController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacings.xl),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacings.xl,
        crossAxisSpacing: AppSpacings.xl,
        children: List.generate(
          controller.notes.length,
          (index) {
            final note = controller.notes[index];
            return FadeInDown(
              delay: Duration(milliseconds: 100 * index),
              child: NoteCard(
                note: note,
                selected: controller.isSelected(note.id),
                onSelect: () => controller.toggleSelect(note.id!),
                onTap: () {
                  if (controller.selectedIds.isEmpty) {
                    Get.toNamed(AppRoutes.noteDetail, arguments: note.id);
                  } else {
                    controller.toggleSelect(note.id!);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
