import 'package:dartz/dartz.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../core/exceptions/error.dart';
import '../repositories/note_repository.dart';

class DeleteMultipleNoteUsecase {
  final NoteRepository _repository;

  const DeleteMultipleNoteUsecase(this._repository);

  Future<Either<NoteError, Unit>> call(List<String> ids) async {
    try {
      await _repository.deleteMultiNotes(ids);
      return right(unit);
    } catch (e) {
      return left(
        NoteError(message: "failed_delete_notes".tr),
      );
    }
  }
}
