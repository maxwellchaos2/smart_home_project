// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_auth_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexAuthTokenModel {
  String get accessToken;
  String get refreshToken;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get expiresAt;
  int? get projectId;

  /// Serializes this YandexAuthTokenModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexAuthTokenModel &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, expiresAt, projectId);

  @override
  String toString() {
    return 'YandexAuthTokenModel(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt, projectId: $projectId)';
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _YandexAuthTokenModel extends YandexAuthTokenModel {
  const _YandexAuthTokenModel(
      {required this.accessToken,
      required this.refreshToken,
      @JsonKey(fromJson: dateTimeFromJson) required this.expiresAt,
      required this.projectId})
      : super._();
  factory _YandexAuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$YandexAuthTokenModelFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime expiresAt;
  @override
  final int? projectId;

  @override
  Map<String, dynamic> toJson() {
    return _$YandexAuthTokenModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YandexAuthTokenModel &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, expiresAt, projectId);

  @override
  String toString() {
    return 'YandexAuthTokenModel(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt, projectId: $projectId)';
  }
}

// dart format on
