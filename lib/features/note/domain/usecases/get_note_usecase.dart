import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/exceptions/error.dart';
import '../../../../core/exceptions/exception.dart';
import '../entities/note_entity.dart';
import '../repositories/note_repository.dart';

class GetNoteUsecase {
  final NoteRepository _repository;

  const GetNoteUsecase(this._repository);

  Future<Either<NoteError, NoteEntity>> call(String id) async {
    try {
      final note = await _repository.getNote(id);
      final noteEntity = note.toDomain();

      return right(noteEntity);
    } catch (e) {
      if (e is NoRecordsException) {
        return left(
          NoteError(message: 'no_match_note'.tr),
        );
      } else {
        return left(
          NoteError(message: "failed_load_notes".tr),
        );
      }
    }
  }
}
