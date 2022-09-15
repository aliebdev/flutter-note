import 'package:simple_hive_note/core/exceptions/error.dart';

import 'package:dartz/dartz.dart';
import 'package:simple_hive_note/core/exceptions/exception.dart';
import 'package:simple_hive_note/features/note/domain/entities/note_entity.dart';
import 'package:simple_hive_note/features/note/domain/repositories/note_repository.dart';

import '../../../../core/usecase/base_usecase.dart';
import 'package:get/get.dart';

class GetAllNotesUsecase extends BaseUseCase<List<NoteEntity>> {
  final NoteRepository _repository;

  GetAllNotesUsecase(this._repository);

  @override
  Future<Either<NoteError, List<NoteEntity>>> call([Unit? params]) async {
    try {
      final notes = _repository.getAllNotes();
      final sortedNotes =
          (notes..sort()).map((note) => note.toDomain()).toList();

      return right(sortedNotes);
    } catch (e) {
      print("USECASE ERROR ====> $e");
      if (e is NoRecordsException) {
        return left(
          NoteError(message: 'empty_note'.tr),
        );
      } else {
        return left(
          NoteError(message: "failed_load_notes".tr),
        );
      }
    }
  }
}
