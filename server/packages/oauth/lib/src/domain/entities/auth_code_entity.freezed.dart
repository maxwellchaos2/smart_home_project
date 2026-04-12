// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_code_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthCodeEntity {
  String get code => throw _privateConstructorUsedError;
  String get clientId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// Create a copy of AuthCodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthCodeEntityCopyWith<AuthCodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCodeEntityCopyWith<$Res> {
  factory $AuthCodeEntityCopyWith(
          AuthCodeEntity value, $Res Function(AuthCodeEntity) then) =
      _$AuthCodeEntityCopyWithImpl<$Res, AuthCodeEntity>;
  @useResult
  $Res call({String code, String clientId, int userId, DateTime expiresAt});
}

/// @nodoc
class _$AuthCodeEntityCopyWithImpl<$Res, $Val extends AuthCodeEntity>
    implements $AuthCodeEntityCopyWith<$Res> {
  _$AuthCodeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthCodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? clientId = null,
    Object? userId = null,
    Object? expiresAt = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthCodeEntityImplCopyWith<$Res>
    implements $AuthCodeEntityCopyWith<$Res> {
  factory _$$AuthCodeEntityImplCopyWith(_$AuthCodeEntityImpl value,
          $Res Function(_$AuthCodeEntityImpl) then) =
      __$$AuthCodeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String clientId, int userId, DateTime expiresAt});
}

/// @nodoc
class __$$AuthCodeEntityImplCopyWithImpl<$Res>
    extends _$AuthCodeEntityCopyWithImpl<$Res, _$AuthCodeEntityImpl>
    implements _$$AuthCodeEntityImplCopyWith<$Res> {
  __$$AuthCodeEntityImplCopyWithImpl(
      _$AuthCodeEntityImpl _value, $Res Function(_$AuthCodeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthCodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? clientId = null,
    Object? userId = null,
    Object? expiresAt = null,
  }) {
    return _then(_$AuthCodeEntityImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AuthCodeEntityImpl extends _AuthCodeEntity {
  const _$AuthCodeEntityImpl(
      {required this.code,
      required this.clientId,
      required this.userId,
      required this.expiresAt})
      : super._();

  @override
  final String code;
  @override
  final String clientId;
  @override
  final int userId;
  @override
  final DateTime expiresAt;

  @override
  String toString() {
    return 'AuthCodeEntity(code: $code, clientId: $clientId, userId: $userId, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCodeEntityImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, code, clientId, userId, expiresAt);

  /// Create a copy of AuthCodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthCodeEntityImplCopyWith<_$AuthCodeEntityImpl> get copyWith =>
      __$$AuthCodeEntityImplCopyWithImpl<_$AuthCodeEntityImpl>(
          this, _$identity);
}

abstract class _AuthCodeEntity extends AuthCodeEntity {
  const factory _AuthCodeEntity(
      {required final String code,
      required final String clientId,
      required final int userId,
      required final DateTime expiresAt}) = _$AuthCodeEntityImpl;
  const _AuthCodeEntity._() : super._();

  @override
  String get code;
  @override
  String get clientId;
  @override
  int get userId;
  @override
  DateTime get expiresAt;

  /// Create a copy of AuthCodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthCodeEntityImplCopyWith<_$AuthCodeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
