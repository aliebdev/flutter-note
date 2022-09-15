// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NoteEntityTearOff {
  const _$NoteEntityTearOff();

  _NoteEntity call(
      {String? id,
      String? title,
      String? description,
      Color? color,
      DateTime? dateTime,
      List<TodoEntity> todos = const []}) {
    return _NoteEntity(
      id: id,
      title: title,
      description: description,
      color: color,
      dateTime: dateTime,
      todos: todos,
    );
  }
}

/// @nodoc
const $NoteEntity = _$NoteEntityTearOff();

/// @nodoc
mixin _$NoteEntity {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  List<TodoEntity> get todos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteEntityCopyWith<NoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteEntityCopyWith<$Res> {
  factory $NoteEntityCopyWith(
          NoteEntity value, $Res Function(NoteEntity) then) =
      _$NoteEntityCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? title,
      String? description,
      Color? color,
      DateTime? dateTime,
      List<TodoEntity> todos});
}

/// @nodoc
class _$NoteEntityCopyWithImpl<$Res> implements $NoteEntityCopyWith<$Res> {
  _$NoteEntityCopyWithImpl(this._value, this._then);

  final NoteEntity _value;
  // ignore: unused_field
  final $Res Function(NoteEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? color = freezed,
    Object? dateTime = freezed,
    Object? todos = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoEntity>,
    ));
  }
}

/// @nodoc
abstract class _$NoteEntityCopyWith<$Res> implements $NoteEntityCopyWith<$Res> {
  factory _$NoteEntityCopyWith(
          _NoteEntity value, $Res Function(_NoteEntity) then) =
      __$NoteEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? title,
      String? description,
      Color? color,
      DateTime? dateTime,
      List<TodoEntity> todos});
}

/// @nodoc
class __$NoteEntityCopyWithImpl<$Res> extends _$NoteEntityCopyWithImpl<$Res>
    implements _$NoteEntityCopyWith<$Res> {
  __$NoteEntityCopyWithImpl(
      _NoteEntity _value, $Res Function(_NoteEntity) _then)
      : super(_value, (v) => _then(v as _NoteEntity));

  @override
  _NoteEntity get _value => super._value as _NoteEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? color = freezed,
    Object? dateTime = freezed,
    Object? todos = freezed,
  }) {
    return _then(_NoteEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoEntity>,
    ));
  }
}

/// @nodoc

class _$_NoteEntity extends _NoteEntity {
  _$_NoteEntity(
      {this.id,
      this.title,
      this.description,
      this.color,
      this.dateTime,
      this.todos = const []})
      : super._();

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final Color? color;
  @override
  final DateTime? dateTime;
  @JsonKey()
  @override
  final List<TodoEntity> todos;

  @override
  String toString() {
    return 'NoteEntity(id: $id, title: $title, description: $description, color: $color, dateTime: $dateTime, todos: $todos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoteEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.todos, todos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(todos));

  @JsonKey(ignore: true)
  @override
  _$NoteEntityCopyWith<_NoteEntity> get copyWith =>
      __$NoteEntityCopyWithImpl<_NoteEntity>(this, _$identity);
}

abstract class _NoteEntity extends NoteEntity {
  factory _NoteEntity(
      {String? id,
      String? title,
      String? description,
      Color? color,
      DateTime? dateTime,
      List<TodoEntity> todos}) = _$_NoteEntity;
  _NoteEntity._() : super._();

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  Color? get color;
  @override
  DateTime? get dateTime;
  @override
  List<TodoEntity> get todos;
  @override
  @JsonKey(ignore: true)
  _$NoteEntityCopyWith<_NoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
