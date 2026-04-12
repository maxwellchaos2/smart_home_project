// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_auth_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexAuthTokenEntity {
  String get accessToken;
  String get refreshToken;
  DateTime get expiresAt;
  int? get projectId;

  /// Create a copy of YandexAuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $YandexAuthTokenEntityCopyWith<YandexAuthTokenEntity> get copyWith =>
      _$YandexAuthTokenEntityCopyWithImpl<YandexAuthTokenEntity>(
          this as YandexAuthTokenEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexAuthTokenEntity &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, expiresAt, projectId);

  @override
  String toString() {
    return 'YandexAuthTokenEntity(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt, projectId: $projectId)';
  }
}

/// @nodoc
abstract mixin class $YandexAuthTokenEntityCopyWith<$Res> {
  factory $YandexAuthTokenEntityCopyWith(YandexAuthTokenEntity value,
          $Res Function(YandexAuthTokenEntity) _then) =
      _$YandexAuthTokenEntityCopyWithImpl;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      DateTime expiresAt,
      int? projectId});
}

/// @nodoc
class _$YandexAuthTokenEntityCopyWithImpl<$Res>
    implements $YandexAuthTokenEntityCopyWith<$Res> {
  _$YandexAuthTokenEntityCopyWithImpl(this._self, this._then);

  final YandexAuthTokenEntity _self;
  final $Res Function(YandexAuthTokenEntity) _then;

  /// Create a copy of YandexAuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresAt = null,
    Object? projectId = freezed,
  }) {
    return _then(_self.copyWith(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _YandexAuthTokenEntity extends YandexAuthTokenEntity {
  const _YandexAuthTokenEntity(
      {required this.accessToken,
      required this.refreshToken,
      required this.expiresAt,
      required this.projectId})
      : super._();

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final DateTime expiresAt;
  @override
  final int? projectId;

  /// Create a copy of YandexAuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$YandexAuthTokenEntityCopyWith<_YandexAuthTokenEntity> get copyWith =>
      __$YandexAuthTokenEntityCopyWithImpl<_YandexAuthTokenEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YandexAuthTokenEntity &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, expiresAt, projectId);

  @override
  String toString() {
    return 'YandexAuthTokenEntity(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt, projectId: $projectId)';
  }
}

/// @nodoc
abstract mixin class _$YandexAuthTokenEntityCopyWith<$Res>
    implements $YandexAuthTokenEntityCopyWith<$Res> {
  factory _$YandexAuthTokenEntityCopyWith(_YandexAuthTokenEntity value,
          $Res Function(_YandexAuthTokenEntity) _then) =
      __$YandexAuthTokenEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      DateTime expiresAt,
      int? projectId});
}

/// @nodoc
class __$YandexAuthTokenEntityCopyWithImpl<$Res>
    implements _$YandexAuthTokenEntityCopyWith<$Res> {
  __$YandexAuthTokenEntityCopyWithImpl(this._self, this._then);

  final _YandexAuthTokenEntity _self;
  final $Res Function(_YandexAuthTokenEntity) _then;

  /// Create a copy of YandexAuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresAt = null,
    Object? projectId = freezed,
  }) {
    return _then(_YandexAuthTokenEntity(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
