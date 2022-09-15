import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/features/note/domain/usecases/get_note_usecase.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/utils/utils.dart';
import '../../domain/entities/note_entity.dart';
import '../../domain/usecases/add_update_note_usecase.dart';
import '../../domain/usecases/delete_multiple_notes_usecase.dart';
import '../../domain/usecases/delete_note_usecase.dart';
import '../../domain/usecases/get_all_note_usecase.dart';
import '../../domain/entities/todo_entity.dart';

class NoteController extends GetxController {
  final GetNoteUsecase _getNoteUsecase;
  final GetAllNotesUsecase _getAllNotesUsecase;
  final AddUpdateNoteUsecase _addUpdateNoteUsecase;
  final DeleteNoteUsecase _deleteNoteUsecase;
  final DeleteMultipleNoteUsecase _deleteMultipleNoteUsecase;
  NoteController(
    this._getNoteUsecase,
    this._getAllNotesUsecase,
    this._addUpdateNoteUsecase,
    this._deleteNoteUsecase,
    this._deleteMultipleNoteUsecase,
  );

  List<NoteEntity> notes = <NoteEntity>[];
  NoteEntity? note;
  String? error;

  List<String> selectedIds = <String>[];

  late TextEditingController titleController;
  late TextEditingController descriptionController;

  RxBool isLoading = false.obs;
  RxList<TodoEntity> todos = <TodoEntity>[].obs;
  Rx<Color> selectedColor = (colors.randomElement as Color).obs;

  @override
  void onInit() {
    super.onInit();

    fetchAllNotes();
  }

  void setSelectedColor(Color value) => selectedColor.value = value;

  void setNoteError(String error) {
    this.error = error;
    // update(['note_list', 'note_detail']);
  }

  bool isErrorNotEmpty() => error != null;

  fetchNote(String noteId) async {
    final failOrSuccess = await _getNoteUsecase(noteId);

    failOrSuccess.fold(
      (error) => setNoteError(error.message!),
      (note) {
        this.note = note;
        error = null;
      },
    );
    update(['note_detail']);
  }

  fetchAllNotes() async {
    final failOrSuccess = await _getAllNotesUsecase();

    failOrSuccess.fold(
      (error) => setNoteError(error.message!),
      (noteEntities) {
        notes.clear();
        notes.addAll(noteEntities);
        error = null;
      },
    );
    update(['note_list']);
  }

  addUpdateNote(NoteEntity note, {bool pop = true}) async {
    final bool _isEdit = note.id != null;
    final failOrSuccess = await _addUpdateNoteUsecase(note);

    isLoading.value = true;

    await Future.delayed(animationDuration);

    failOrSuccess.fold(
      (error) {
        AppSnackbar.showSnackbar(error.message ?? "", isError: true);
      },
      (_) {
        if (_isEdit) {
          AppSnackbar.showSnackbar("note_updated".tr);
        } else {
          AppSnackbar.showSnackbar("note_added".tr);
        }
        if (pop) {
          Get.offAndToNamed(AppRoutes.note);
        }
      },
    );

    isLoading.value = false;
  }

  bool isSelected(String? id) => (id != null) && (selectedIds.contains(id));

  toggleSelect(String noteId) {
    if (selectedIds.contains(noteId)) {
      selectedIds.remove(noteId);
    } else {
      selectedIds.add(noteId);
    }
    update(['note_list', 'note_actions']);
  }

  void cancelDeleting() {
    selectedIds.clear();
    update(['note_list', 'note_actions']);
  }

  deleteMultiNotes() async {
    final failOrSuccess = await _deleteMultipleNoteUsecase(selectedIds);

    failOrSuccess.fold(
      (error) => AppSnackbar.showSnackbar(error.message ?? "", isError: true),
      (_) {
        AppSnackbar.showSnackbar("${selectedIds.length} ${"delete_msg".tr}");
        selectedIds.clear();
        update(['note_list', 'note_actions']);
      },
    );
  }

  delete(String noteId) async {
    final failOrSuccess = await _deleteNoteUsecase(noteId);

    failOrSuccess.fold(
      (error) => AppSnackbar.showSnackbar(error.message ?? "", isError: true),
      (_) {
        AppSnackbar.showSnackbar("1 ${"delete_msg".tr}");
        update(['note_list']);
      },
    );
  }

  addEmptyTodo() {
    todos.add(TodoEntity.empty());
  }

  removeTodo(TodoEntity todo) {
    todos.remove(todo);
  }

  todoValueChanged(String value, String id) {
    final updateTodoList = todos.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(title: value);
      }
      return todo;
    }).toList();

    todos.value = updateTodoList;
  }

  toggleTodoIsCompleted(String todoId) async {
    final updatedNote = note!.copyWith(
      todos: note!.todos.map((todo) {
        if (todo.id == todoId) {
          return todo.copyWith(isCompleted: !todo.isCompleted);
        }
        return todo;
      }).toList(),
    );

    final failOrSuccess = await _addUpdateNoteUsecase(updatedNote);

    failOrSuccess.fold(
      (error) => AppSnackbar.showSnackbar(error.message ?? ""),
      (_) {
        note = updatedNote;
      },
    );
    update(['note_detail']);
  }
}
