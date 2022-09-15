import 'package:dartz/dartz.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../core/exceptions/error.dart';
import '../repositories/note_repository.dart';

class DeleteNoteUsecase {
  final NoteRepository _repository;

  const DeleteNoteUsecase(this._repository);

  Future<Either<NoteError, Unit>> call(String id) async {
    try {
      await _repository.deleteNote(id);
      return right(unit);
    } catch (e) {
      return left(
        NoteError(message: "failed_delete_notes".tr),
      );
    }
  }
}
