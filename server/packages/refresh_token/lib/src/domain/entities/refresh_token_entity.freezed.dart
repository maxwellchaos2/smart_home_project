// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RefreshTokenEntity {
  int get id => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenEntityCopyWith<RefreshTokenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenEntityCopyWith<$Res> {
  factory $RefreshTokenEntityCopyWith(
          RefreshTokenEntity value, $Res Function(RefreshTokenEntity) then) =
      _$RefreshTokenEntityCopyWithImpl<$Res, RefreshTokenEntity>;
  @useResult
  $Res call(
      {int id,
      String refreshToken,
      int userId,
      DateTime expiresAt,
      DateTime createdAt});
}

/// @nodoc
class _$RefreshTokenEntityCopyWithImpl<$Res, $Val extends RefreshTokenEntity>
    implements $RefreshTokenEntityCopyWith<$Res> {
  _$RefreshTokenEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? refreshToken = null,
    Object? userId = null,
    Object? expiresAt = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenEntityImplCopyWith<$Res>
    implements $RefreshTokenEntityCopyWith<$Res> {
  factory _$$RefreshTokenEntityImplCopyWith(_$RefreshTokenEntityImpl value,
          $Res Function(_$RefreshTokenEntityImpl) then) =
      __$$RefreshTokenEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String refreshToken,
      int userId,
      DateTime expiresAt,
      DateTime createdAt});
}

/// @nodoc
class __$$RefreshTokenEntityImplCopyWithImpl<$Res>
    extends _$RefreshTokenEntityCopyWithImpl<$Res, _$RefreshTokenEntityImpl>
    implements _$$RefreshTokenEntityImplCopyWith<$Res> {
  __$$RefreshTokenEntityImplCopyWithImpl(_$RefreshTokenEntityImpl _value,
      $Res Function(_$RefreshTokenEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? refreshToken = null,
    Object? userId = null,
    Object? expiresAt = null,
    Object? createdAt = null,
  }) {
    return _then(_$RefreshTokenEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$RefreshTokenEntityImpl extends _RefreshTokenEntity {
  const _$RefreshTokenEntityImpl(
      {required this.id,
      required this.refreshToken,
      required this.userId,
      required this.expiresAt,
      required this.createdAt})
      : super._();

  @override
  final int id;
  @override
  final String refreshToken;
  @override
  final int userId;
  @override
  final DateTime expiresAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'RefreshTokenEntity(id: $id, refreshToken: $refreshToken, userId: $userId, expiresAt: $expiresAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, refreshToken, userId, expiresAt, createdAt);

  /// Create a copy of RefreshTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenEntityImplCopyWith<_$RefreshTokenEntityImpl> get copyWith =>
      __$$RefreshTokenEntityImplCopyWithImpl<_$RefreshTokenEntityImpl>(
          this, _$identity);
}

abstract class _RefreshTokenEntity extends RefreshTokenEntity {
  const factory _RefreshTokenEntity(
      {required final int id,
      required final String refreshToken,
      required final int userId,
      required final DateTime expiresAt,
      required final DateTime createdAt}) = _$RefreshTokenEntityImpl;
  const _RefreshTokenEntity._() : super._();

  @override
  int get id;
  @override
  String get refreshToken;
  @override
  int get userId;
  @override
  DateTime get expiresAt;
  @override
  DateTime get createdAt;

  /// Create a copy of RefreshTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenEntityImplCopyWith<_$RefreshTokenEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
