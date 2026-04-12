// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) {
  return _RoomModel.fromJson(json);
}

/// @nodoc
mixin _$RoomModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get floorId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get planMediaPath => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RoomModelImpl extends _RoomModel {
  const _$RoomModelImpl(
      {required this.id,
      required this.name,
      required this.floorId,
      @JsonKey(fromJson: dateTimeFromJson) required this.createdAt,
      @JsonKey(fromJson: dateTimeFromJson) required this.updatedAt,
      required this.planMediaPath,
      required this.projectId})
      : super._();

  factory _$RoomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int floorId;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime updatedAt;
  @override
  final String? planMediaPath;
  @override
  final int projectId;

  @override
  String toString() {
    return 'RoomModel(id: $id, name: $name, floorId: $floorId, createdAt: $createdAt, updatedAt: $updatedAt, planMediaPath: $planMediaPath, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.planMediaPath, planMediaPath) ||
                other.planMediaPath == planMediaPath) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, floorId, createdAt,
      updatedAt, planMediaPath, projectId);
}

abstract class _RoomModel extends RoomModel {
  const factory _RoomModel(
      {required final int id,
      required final String name,
      required final int floorId,
      @JsonKey(fromJson: dateTimeFromJson) required final DateTime createdAt,
      @JsonKey(fromJson: dateTimeFromJson) required final DateTime updatedAt,
      required final String? planMediaPath,
      required final int projectId}) = _$RoomModelImpl;
  const _RoomModel._() : super._();

  factory _RoomModel.fromJson(Map<String, dynamic> json) =
      _$RoomModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get floorId;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get updatedAt;
  @override
  String? get planMediaPath;
  @override
  int get projectId;
}
