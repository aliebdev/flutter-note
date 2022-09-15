import 'package:get/get.dart';
import 'package:simple_hive_note/features/note/domain/usecases/add_update_note_usecase.dart';
import 'package:simple_hive_note/features/note/domain/usecases/delete_multiple_notes_usecase.dart';
import 'package:simple_hive_note/features/note/domain/usecases/delete_note_usecase.dart';
import 'package:simple_hive_note/features/note/domain/usecases/get_note_usecase.dart';

import '../data/repositories/note_repository.dart';
import '../domain/usecases/get_all_note_usecase.dart';
import '../presentation/controllers/note_controller.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => const NoteRepositoryImpl());
    Get.lazyPut(() => GetNoteUsecase(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(() => GetAllNotesUsecase(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(() => AddUpdateNoteUsecase(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(() => DeleteNoteUsecase(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(() => DeleteNoteUsecase(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(
        () => DeleteMultipleNoteUsecase(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(
      () => NoteController(
        Get.find<GetNoteUsecase>(),
        Get.find<GetAllNotesUsecase>(),
        Get.find<AddUpdateNoteUsecase>(),
        Get.find<DeleteNoteUsecase>(),
        Get.find<DeleteMultipleNoteUsecase>(),
      ),
    );
  }
}
