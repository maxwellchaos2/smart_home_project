// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthTokenEntity {
  String get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;

  /// Create a copy of AuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthTokenEntityCopyWith<AuthTokenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenEntityCopyWith<$Res> {
  factory $AuthTokenEntityCopyWith(
          AuthTokenEntity value, $Res Function(AuthTokenEntity) then) =
      _$AuthTokenEntityCopyWithImpl<$Res, AuthTokenEntity>;
  @useResult
  $Res call({String accessToken, String? refreshToken, int? userId});
}

/// @nodoc
class _$AuthTokenEntityCopyWithImpl<$Res, $Val extends AuthTokenEntity>
    implements $AuthTokenEntityCopyWith<$Res> {
  _$AuthTokenEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthTokenEntityImplCopyWith<$Res>
    implements $AuthTokenEntityCopyWith<$Res> {
  factory _$$AuthTokenEntityImplCopyWith(_$AuthTokenEntityImpl value,
          $Res Function(_$AuthTokenEntityImpl) then) =
      __$$AuthTokenEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String? refreshToken, int? userId});
}

/// @nodoc
class __$$AuthTokenEntityImplCopyWithImpl<$Res>
    extends _$AuthTokenEntityCopyWithImpl<$Res, _$AuthTokenEntityImpl>
    implements _$$AuthTokenEntityImplCopyWith<$Res> {
  __$$AuthTokenEntityImplCopyWithImpl(
      _$AuthTokenEntityImpl _value, $Res Function(_$AuthTokenEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$AuthTokenEntityImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$AuthTokenEntityImpl extends _AuthTokenEntity {
  const _$AuthTokenEntityImpl(
      {required this.accessToken,
      required this.refreshToken,
      required this.userId})
      : super._();

  @override
  final String accessToken;
  @override
  final String? refreshToken;
  @override
  final int? userId;

  @override
  String toString() {
    return 'AuthTokenEntity(accessToken: $accessToken, refreshToken: $refreshToken, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokenEntityImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, userId);

  /// Create a copy of AuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokenEntityImplCopyWith<_$AuthTokenEntityImpl> get copyWith =>
      __$$AuthTokenEntityImplCopyWithImpl<_$AuthTokenEntityImpl>(
          this, _$identity);
}

abstract class _AuthTokenEntity extends AuthTokenEntity {
  const factory _AuthTokenEntity(
      {required final String accessToken,
      required final String? refreshToken,
      required final int? userId}) = _$AuthTokenEntityImpl;
  const _AuthTokenEntity._() : super._();

  @override
  String get accessToken;
  @override
  String? get refreshToken;
  @override
  int? get userId;

  /// Create a copy of AuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthTokenEntityImplCopyWith<_$AuthTokenEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
