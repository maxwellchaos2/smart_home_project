// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FloorResponseModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get planMediaPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$FloorResponseModelImpl extends _FloorResponseModel {
  const _$FloorResponseModelImpl(
      {required this.id,
      required this.name,
      required this.projectId,
      required this.createdAt,
      required this.updatedAt,
      required this.planMediaPath})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final int projectId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? planMediaPath;

  @override
  String toString() {
    return 'FloorResponseModel(id: $id, name: $name, projectId: $projectId, createdAt: $createdAt, updatedAt: $updatedAt, planMediaPath: $planMediaPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.planMediaPath, planMediaPath) ||
                other.planMediaPath == planMediaPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, projectId, createdAt, updatedAt, planMediaPath);

  @override
  Map<String, dynamic> toJson() {
    return _$$FloorResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FloorResponseModel extends FloorResponseModel {
  const factory _FloorResponseModel(
      {required final int id,
      required final String name,
      required final int projectId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String? planMediaPath}) = _$FloorResponseModelImpl;
  const _FloorResponseModel._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  int get projectId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get planMediaPath;
}
