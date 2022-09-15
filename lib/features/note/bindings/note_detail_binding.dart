import 'package:get/get.dart';
import 'package:simple_hive_note/features/note/data/repositories/note_repository.dart';
import 'package:simple_hive_note/features/note/domain/usecases/get_note_usecase.dart';
import 'package:simple_hive_note/features/note/presentation/controllers/note_detail_controller.dart';

class NoteDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetNoteUsecase(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(() => NoteDetailController(Get.find<GetNoteUsecase>()));
  }
}
