import 'dart:convert' as convert;

import 'package:get_storage/get_storage.dart';
import 'package:simple_hive_note/core/exceptions/exception.dart';

abstract class LocalStorageRepository {
  GetStorage get storage;
  T? read<T>(String key, {T Function(Map)? construct});
  Future write(String key, dynamic json);
  Future remove(String key);
  Future removeAll();
}

class LocalStorageProvider implements LocalStorageRepository {
  LocalStorageProvider._initial();

  static final LocalStorageProvider _singleton =
      LocalStorageProvider._initial();

  factory LocalStorageProvider() => _singleton;

  @override
  GetStorage get storage => GetStorage();

  @override
  write(String key, dynamic value) async {
    try {
      await storage.write(key, convert.jsonEncode(value));
    } catch (e) {
      rethrow;
    }
  }

  @override
  T? read<T>(String key, {T Function(Map)? construct}) {
    try {
      String? value = storage.read(key);

      if (value == null) {
        throw NoteAppException.noRecords();
      }

      if (construct == null) return convert.jsonDecode(value);
      Map<String, dynamic> json = convert.jsonDecode(value);
      return construct(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  remove(String key) async {
    try {
      await storage.remove(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  removeAll() async {
    try {
      await storage.erase();
    } catch (e) {
      rethrow;
    }
  }
}
