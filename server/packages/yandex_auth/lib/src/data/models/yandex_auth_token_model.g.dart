// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yandex_auth_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YandexAuthTokenModel _$YandexAuthTokenModelFromJson(
        Map<String, dynamic> json) =>
    _YandexAuthTokenModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresAt: dateTimeFromJson(json['expires_at']),
      projectId: (json['project_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$YandexAuthTokenModelToJson(
        _YandexAuthTokenModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_at': instance.expiresAt.toIso8601String(),
      'project_id': instance.projectId,
    };
