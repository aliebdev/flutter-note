import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../bindings/note_binding.dart';
import '../presentation/pages/pages.dart';

List<GetPage> noteRoutes = [
  GetPage(
    name: AppRoutes.note,
    page: () => const NoteScreen(),
    binding: NoteBinding(),
    children: [
      GetPage(
        name: AppRoutes.setting,
        page: () => SettingScreen(),
      ),
    ],
  ),
  GetPage(
    name: AppRoutes.addUpdate,
    page: () => const AddUpdateNoteScreen(),
  ),
  GetPage(
    name: AppRoutes.noteDetail,
    page: () => const NoteDetailScreen(),
  ),
];
