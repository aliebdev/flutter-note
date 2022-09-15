import 'dart:ui' show Color;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/todo_entity.dart';

part 'note_entity.freezed.dart';

@freezed
class NoteEntity with _$NoteEntity {
  NoteEntity._();

  factory NoteEntity({
    String? id,
    String? title,
    String? description,
    Color? color,
    DateTime? dateTime,
    @Default([]) List<TodoEntity> todos,
  }) = _NoteEntity;

  final DateFormat _formatter = DateFormat('MMMM dd, yyyy');
  String get date => dateTime != null ? _formatter.format(dateTime!) : '';

  final DateFormat _formatter1 = DateFormat('MMMM dd, yyyy  h:m a');
  String get dateWithTime =>
      dateTime != null ? _formatter1.format(dateTime!) : '';

  bool get hasTodo => todos.isNotEmpty;
}
