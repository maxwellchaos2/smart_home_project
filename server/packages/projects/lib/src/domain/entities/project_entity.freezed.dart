// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get hasYandexAuth => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectEntityCopyWith<ProjectEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectEntityCopyWith<$Res> {
  factory $ProjectEntityCopyWith(
          ProjectEntity value, $Res Function(ProjectEntity) then) =
      _$ProjectEntityCopyWithImpl<$Res, ProjectEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      DateTime createdAt,
      bool hasYandexAuth,
      int userId});
}

/// @nodoc
class _$ProjectEntityCopyWithImpl<$Res, $Val extends ProjectEntity>
    implements $ProjectEntityCopyWith<$Res> {
  _$ProjectEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? hasYandexAuth = null,
    Object? userId = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasYandexAuth: null == hasYandexAuth
          ? _value.hasYandexAuth
          : hasYandexAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectEntityImplCopyWith<$Res>
    implements $ProjectEntityCopyWith<$Res> {
  factory _$$ProjectEntityImplCopyWith(
          _$ProjectEntityImpl value, $Res Function(_$ProjectEntityImpl) then) =
      __$$ProjectEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      DateTime createdAt,
      bool hasYandexAuth,
      int userId});
}

/// @nodoc
class __$$ProjectEntityImplCopyWithImpl<$Res>
    extends _$ProjectEntityCopyWithImpl<$Res, _$ProjectEntityImpl>
    implements _$$ProjectEntityImplCopyWith<$Res> {
  __$$ProjectEntityImplCopyWithImpl(
      _$ProjectEntityImpl _value, $Res Function(_$ProjectEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? hasYandexAuth = null,
    Object? userId = null,
  }) {
    return _then(_$ProjectEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasYandexAuth: null == hasYandexAuth
          ? _value.hasYandexAuth
          : hasYandexAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProjectEntityImpl extends _ProjectEntity {
  const _$ProjectEntityImpl(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.hasYandexAuth,
      required this.userId})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final bool hasYandexAuth;
  @override
  final int userId;

  @override
  String toString() {
    return 'ProjectEntity(id: $id, name: $name, createdAt: $createdAt, hasYandexAuth: $hasYandexAuth, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.hasYandexAuth, hasYandexAuth) ||
                other.hasYandexAuth == hasYandexAuth) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, createdAt, hasYandexAuth, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectEntityImplCopyWith<_$ProjectEntityImpl> get copyWith =>
      __$$ProjectEntityImplCopyWithImpl<_$ProjectEntityImpl>(this, _$identity);
}

abstract class _ProjectEntity extends ProjectEntity {
  const factory _ProjectEntity(
      {required final int id,
      required final String name,
      required final DateTime createdAt,
      required final bool hasYandexAuth,
      required final int userId}) = _$ProjectEntityImpl;
  const _ProjectEntity._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  bool get hasYandexAuth;
  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$ProjectEntityImplCopyWith<_$ProjectEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
