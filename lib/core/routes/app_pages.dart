import 'package:get/get.dart';

import '../../features/note/routes/note_routes.dart';
import 'app_routes.dart';

class AppPages {
  static String get initialRoute => AppRoutes.note;
  static List<GetPage> get pages => [
        ...noteRoutes,
      ];
}
