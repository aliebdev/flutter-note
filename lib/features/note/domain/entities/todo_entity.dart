import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo_entity.freezed.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const TodoEntity._();

  factory TodoEntity({
    String? id,
    String? title,
    @Default(false) bool isCompleted,
  }) = _TodoEntity;

  factory TodoEntity.empty() {
    const _uuid = Uuid();
    return TodoEntity(
      id: _uuid.v4(),
      title: '',
      isCompleted: false,
    );
  }
}
