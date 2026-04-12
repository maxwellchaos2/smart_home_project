// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FloorEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get planMediaPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FloorEntityCopyWith<FloorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorEntityCopyWith<$Res> {
  factory $FloorEntityCopyWith(
          FloorEntity value, $Res Function(FloorEntity) then) =
      _$FloorEntityCopyWithImpl<$Res, FloorEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      int projectId,
      DateTime createdAt,
      DateTime updatedAt,
      String? planMediaPath});
}

/// @nodoc
class _$FloorEntityCopyWithImpl<$Res, $Val extends FloorEntity>
    implements $FloorEntityCopyWith<$Res> {
  _$FloorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? projectId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? planMediaPath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      planMediaPath: freezed == planMediaPath
          ? _value.planMediaPath
          : planMediaPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloorEntityImplCopyWith<$Res>
    implements $FloorEntityCopyWith<$Res> {
  factory _$$FloorEntityImplCopyWith(
          _$FloorEntityImpl value, $Res Function(_$FloorEntityImpl) then) =
      __$$FloorEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int projectId,
      DateTime createdAt,
      DateTime updatedAt,
      String? planMediaPath});
}

/// @nodoc
class __$$FloorEntityImplCopyWithImpl<$Res>
    extends _$FloorEntityCopyWithImpl<$Res, _$FloorEntityImpl>
    implements _$$FloorEntityImplCopyWith<$Res> {
  __$$FloorEntityImplCopyWithImpl(
      _$FloorEntityImpl _value, $Res Function(_$FloorEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? projectId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? planMediaPath = freezed,
  }) {
    return _then(_$FloorEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      planMediaPath: freezed == planMediaPath
          ? _value.planMediaPath
          : planMediaPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FloorEntityImpl extends _FloorEntity {
  const _$FloorEntityImpl(
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
    return 'FloorEntity(id: $id, name: $name, projectId: $projectId, createdAt: $createdAt, updatedAt: $updatedAt, planMediaPath: $planMediaPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorEntityImpl &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, projectId, createdAt, updatedAt, planMediaPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorEntityImplCopyWith<_$FloorEntityImpl> get copyWith =>
      __$$FloorEntityImplCopyWithImpl<_$FloorEntityImpl>(this, _$identity);
}

abstract class _FloorEntity extends FloorEntity {
  const factory _FloorEntity(
      {required final int id,
      required final String name,
      required final int projectId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String? planMediaPath}) = _$FloorEntityImpl;
  const _FloorEntity._() : super._();

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
  @override
  @JsonKey(ignore: true)
  _$$FloorEntityImplCopyWith<_$FloorEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
