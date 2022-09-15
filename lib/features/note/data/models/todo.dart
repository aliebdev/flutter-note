import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/todo_entity.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo extends Equatable {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final bool? isCompleted;

  const Todo({
    this.id,
    this.title,
    this.isCompleted,
  });

  factory Todo.fromDomain(TodoEntity todo) {
    return Todo(
      id: todo.id,
      title: todo.title,
      isCompleted: todo.isCompleted,
    );
  }

  TodoEntity toDomain() {
    return TodoEntity(
      id: id,
      title: title,
      isCompleted: isCompleted ?? false,
    );
  }

  @override
  List<Object?> get props => [id, title, isCompleted];
}
