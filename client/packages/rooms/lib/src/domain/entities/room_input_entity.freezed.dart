// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoomInputEntity {
  String get name => throw _privateConstructorUsedError;
  int get floorId => throw _privateConstructorUsedError;
  String? get planMediaPath => throw _privateConstructorUsedError;
}

/// @nodoc

class _$RoomInputEntityImpl implements _RoomInputEntity {
  const _$RoomInputEntityImpl(
      {required this.name, required this.floorId, required this.planMediaPath});

  @override
  final String name;
  @override
  final int floorId;
  @override
  final String? planMediaPath;

  @override
  String toString() {
    return 'RoomInputEntity(name: $name, floorId: $floorId, planMediaPath: $planMediaPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomInputEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.planMediaPath, planMediaPath) ||
                other.planMediaPath == planMediaPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, floorId, planMediaPath);
}

abstract class _RoomInputEntity implements RoomInputEntity {
  const factory _RoomInputEntity(
      {required final String name,
      required final int floorId,
      required final String? planMediaPath}) = _$RoomInputEntityImpl;

  @override
  String get name;
  @override
  int get floorId;
  @override
  String? get planMediaPath;
}
