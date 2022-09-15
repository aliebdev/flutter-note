import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/entities/note_entity.dart';
import '../../controllers/note_controller.dart';
import '../../widgets/add_update/add_todo.dart';
import '../../widgets/add_update/colors_bar.dart';
import '../../widgets/add_update/input_field.dart';
import '../../../domain/entities/todo_entity.dart';

class AddUpdateNoteScreen extends StatefulWidget {
  const AddUpdateNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddUpdateNoteScreen> createState() => _AddUpdateNoteScreenState();
}

class _AddUpdateNoteScreenState extends State<AddUpdateNoteScreen> {
  final controller = Get.find<NoteController>();

  @override
  void initState() {
    super.initState();
    final NoteEntity? note = Get.arguments;

    controller.titleController = TextEditingController(text: note?.title);
    controller.descriptionController =
        TextEditingController(text: note?.description);

    controller.selectedColor.value =
        note?.color ?? colors.randomElement as Color;
    controller.todos.value = note?.todos ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final NoteEntity? note = Get.arguments;
    return Obx(
      () => Stack(
        children: [
          _BuildForm(
            controller: controller,
            note: note,
          ),
          if (controller.isLoading.value)
            FadeIn(
              child: Container(
                color: Colors.black.withOpacity(.2),
              ),
            ),
        ],
      ),
    );
  }
}

class _BuildForm extends StatelessWidget {
  _BuildForm({
    Key? key,
    required this.controller,
    required this.note,
  }) : super(key: key);

  final NoteController controller;
  final NoteEntity? note;
  List<TodoEntity> todos = [];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.selectedColor.value,
        bottomNavigationBar: ColorsBar(
          selectedColor: controller.selectedColor.value,
          onChanged: controller.setSelectedColor,
        ),
        appBar: NoteAppbar(
          actions: [
            ActionButton(
              child: Text(
                controller.isLoading.value ? "saving".tr : "save".tr,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: _addUdpdateNote,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacings.xl),
          child: Column(
            children: [
              BuildField(
                controller: controller.titleController,
                hint: "title".tr,
                autoFocus: true,
                textInputAction: TextInputAction.next,
                maxLines: 2,
              ),
              // const SizedBox(height: 10),
              BuildAddTodoList(controller: controller),
              BuildField(
                controller: controller.descriptionController,
                hint: "type_something".tr,
                maxLines: null,
                fonSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _addUdpdateNote() {
    final noteEntity = NoteEntity(
      id: note != null ? note!.id! : null,
      title: controller.titleController.text,
      description: controller.descriptionController.text,
      dateTime: DateTime.now(),
      color: controller.selectedColor.value,
      todos: controller.todos.value,
    );

    controller.addUpdateNote(noteEntity);
  }
}
