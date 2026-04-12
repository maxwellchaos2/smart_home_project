// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectInputModel {
  String get name => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProjectInputModelImpl extends _ProjectInputModel {
  const _$ProjectInputModelImpl({required this.name, required this.userId})
      : super._();

  @override
  final String name;
  @override
  final int userId;

  @override
  String toString() {
    return 'ProjectInputModel(name: $name, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectInputModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, userId);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectInputModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectInputModel extends ProjectInputModel {
  const factory _ProjectInputModel(
      {required final String name,
      required final int userId}) = _$ProjectInputModelImpl;
  const _ProjectInputModel._() : super._();

  @override
  String get name;
  @override
  int get userId;
}
