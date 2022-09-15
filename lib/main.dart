import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_hive_note/core/utils/utils.dart';

import 'app.dart';
import 'features/note/data/models/note.dart';
import 'features/note/data/models/todo.dart';

void main() async {
  await Hive.initFlutter();
  await GetStorage.init();
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox(AppStrings.databaseBox);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(App());
}
