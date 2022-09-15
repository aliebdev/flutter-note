import 'package:simple_hive_note/core/data/database_provider.dart';

import '../../domain/repositories/note_repository.dart';
import '../models/note.dart';

class NoteRepositoryImpl implements NoteRepository {
  const NoteRepositoryImpl();

  @override
  Future addUpdateNote(Note note) async {
    try {
      await DatabaseProvider().addUpdate(note.id!, note);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteMultiNotes(List<String> ids) async {
    try {
      await DatabaseProvider().deleteAll(ids);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteNote(String id) async {
    try {
      await DatabaseProvider().delete(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<Note> getAllNotes() {
    try {
      final notes =
          DatabaseProvider().getAll().map((note) => note as Note).toList();
      return notes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Note> getNote(String id) async {
    try {
      final note = await DatabaseProvider().get(id) as Note;
      return note;
    } catch (e) {
      rethrow;
    }
  }
}
