import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:simple_hive_note/features/note/domain/entities/note_entity.dart';
import 'package:simple_hive_note/features/note/domain/usecases/get_note_usecase.dart';

class NoteDetailController extends GetxController {
  final GetNoteUsecase _getNoteUsecase;

  NoteDetailController(this._getNoteUsecase);

  Future getNote(String noteId) async {
    final failOrSuccess = await _getNoteUsecase(noteId);

    failOrSuccess.fold(
      (e) {
        print(e.message);
        return Future.error(e.message ?? "");
      },
      (note) {
        return note;
      },
    );
    update(['note_detail']);
    return null;
  }
}
