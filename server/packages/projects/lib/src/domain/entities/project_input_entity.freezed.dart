// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectInputEntity {
  String get name => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
}

/// @nodoc

class _$ProjectInputEntityImpl implements _ProjectInputEntity {
  const _$ProjectInputEntityImpl({required this.name, required this.userId});

  @override
  final String name;
  @override
  final int userId;

  @override
  String toString() {
    return 'ProjectInputEntity(name: $name, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectInputEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, userId);
}

abstract class _ProjectInputEntity implements ProjectInputEntity {
  const factory _ProjectInputEntity(
      {required final String name,
      required final int userId}) = _$ProjectInputEntityImpl;

  @override
  String get name;
  @override
  int get userId;
}
