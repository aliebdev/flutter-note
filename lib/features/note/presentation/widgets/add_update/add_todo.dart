import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/core/utils/theme/spacing.dart';
import 'package:simple_hive_note/features/note/presentation/controllers/note_controller.dart';

class BuildAddTodoList extends StatelessWidget {
  const BuildAddTodoList({Key? key, required this.controller})
      : super(key: key);

  final NoteController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => ListView.builder(
            itemCount: controller.todos.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final todo = controller.todos[index];
              return _TodoFieldTile(
                value: todo.title,
                onChange: (value) =>
                    controller.todoValueChanged(value, todo.id!),
                onRemove: () => controller.removeTodo(todo),
              );
            },
          ),
        ),
        _AddTodoTile(
          onAdd: controller.addEmptyTodo,
        ),
      ],
    );
  }
}

class _TodoFieldTile extends StatefulWidget {
  const _TodoFieldTile({
    Key? key,
    required this.onRemove,
    required this.onChange,
    this.value,
  }) : super(key: key);

  final String? value;
  final VoidCallback onRemove;
  final Function(String value) onChange;

  @override
  _TodoFieldTileState createState() => _TodoFieldTileState();
}

class _TodoFieldTileState extends State<_TodoFieldTile> {
  late TextEditingController todoController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    todoController = TextEditingController(text: widget.value);
    focusNode = FocusNode();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: TextField(
        controller: todoController,
        autofocus: true,
        focusNode: focusNode,
        style: const TextStyle(fontSize: 16),
        maxLines: 3,
        minLines: 1,
        textInputAction: TextInputAction.newline,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintText: "todo..".tr,
        ),
      ),
      trailing: IconButton(
        onPressed: widget.onRemove,
        icon: const Icon(Icons.delete),
      ),
    );
  }
}

class _AddTodoTile extends StatelessWidget {
  const _AddTodoTile({Key? key, this.onAdd}) : super(key: key);

  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Row(
        children: [
          const Icon(Icons.add),
          const SizedBox(width: AppSpacings.l),
          Text(
            "add_todo".tr,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
      onTap: onAdd,
    );
  }
}
