// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefreshTokenModelImpl _$$RefreshTokenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenModelImpl(
      id: (json['id'] as num).toInt(),
      token: json['token'] as String,
      userId: (json['user_id'] as num).toInt(),
      expiresAt: dateTimeFromJson(json['expires_at'] as DateTime),
      createdAt: dateTimeFromJson(json['created_at'] as DateTime),
    );

Map<String, dynamic> _$$RefreshTokenModelImplToJson(
        _$RefreshTokenModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'user_id': instance.userId,
      'expires_at': instance.expiresAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };
