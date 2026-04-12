// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoomResponseModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get floorId => throw _privateConstructorUsedError;
  String? get planMediaPath => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$RoomResponseModelImpl extends _RoomResponseModel {
  const _$RoomResponseModelImpl(
      {required this.id,
      required this.name,
      required this.floorId,
      required this.planMediaPath,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final int floorId;
  @override
  final String? planMediaPath;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'RoomResponseModel(id: $id, name: $name, floorId: $floorId, planMediaPath: $planMediaPath, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.planMediaPath, planMediaPath) ||
                other.planMediaPath == planMediaPath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, floorId, planMediaPath, createdAt, updatedAt);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomResponseModelImplToJson(
      this,
    );
  }
}

abstract class _RoomResponseModel extends RoomResponseModel {
  const factory _RoomResponseModel(
      {required final int id,
      required final String name,
      required final int floorId,
      required final String? planMediaPath,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$RoomResponseModelImpl;
  const _RoomResponseModel._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  int get floorId;
  @override
  String? get planMediaPath;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
}
