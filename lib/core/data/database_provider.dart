import 'package:hive/hive.dart';
import 'package:simple_hive_note/core/exceptions/exception.dart';
import 'package:simple_hive_note/core/utils/strings.dart';

abstract class DatabaseRepository {
  Box get box;
  T get<T>(String id);
  List<T> getAll<T>();
  Future delete(String id);
  Future deleteAll(List<String> keys);
  Future addUpdate<T>(String id, T item);
}

class DatabaseProvider implements DatabaseRepository {
  DatabaseProvider._internal();

  static final DatabaseProvider _singleton = DatabaseProvider._internal();

  factory DatabaseProvider() {
    return _singleton;
  }

  @override
  Box get box => Hive.box(AppStrings.databaseBox);

  @override
  T get<T>(String id) {
    try {
      final data = box.get(id);
      if (data == null) {
        throw NoteAppException.noRecords();
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<T> getAll<T>() {
    // box.clear();
    try {
      final data = box.toMap().values;
      if (data.isEmpty) {
        throw NoteAppException.noRecords();
      }
      return data.toList().cast<T>();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future delete(String id) async {
    try {
      await box.delete(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteAll(List<String> keys) async {
    try {
      await box.deleteAll(keys);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future addUpdate<T>(String id, T item) async {
    try {
      await box.put(id, item);
    } catch (e) {
      rethrow;
    }
  }
}
