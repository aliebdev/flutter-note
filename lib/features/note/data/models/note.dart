import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:simple_hive_note/features/note/data/models/todo.dart';
import 'package:simple_hive_note/features/note/domain/entities/note_entity.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends Equatable implements Comparable {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final int? colorValue;

  @HiveField(4)
  final String? dateTime;

  @HiveField(5)
  final List<Todo>? todos;

  const Note({
    this.id,
    this.title,
    this.description,
    this.colorValue,
    this.dateTime,
    this.todos = const [],
  });

  factory Note.fromNote(NoteEntity note) {
    return Note(
      id: note.id,
      title: note.title,
      description: note.description,
      dateTime: note.dateTime?.toIso8601String(),
      colorValue: note.color?.value,
      todos: note.todos.map((todo) => Todo.fromDomain(todo)).toList(),
    );
  }

  NoteEntity toDomain() {
    return NoteEntity(
      id: id,
      title: title,
      description: description,
      dateTime: DateTime.tryParse(dateTime!),
      color: Color(colorValue!),
      todos: todos?.map((todo) => todo.toDomain()).toList() ?? [],
    );
  }

  bool get validNote => title?.isNotEmpty == true;

  Note copyWith({
    String? id,
    String? title,
    String? description,
    int? colorValue,
    String? dateTime,
    List<Todo>? todos,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      colorValue: colorValue ?? this.colorValue,
      dateTime: dateTime ?? this.dateTime,
      todos: todos ?? this.todos,
    );
  }

  @override
  int compareTo(other) {
    try {
      final _isAfter = DateTime.parse(other.dateTime).isAfter(
        DateTime.parse(dateTime!),
      );
      return _isAfter ? 1 : -1;
    } catch (_) {
      return 1;
    }
  }

  @override
  List<Object?> get props =>
      [id, title, description, colorValue, dateTime, todos];
}
