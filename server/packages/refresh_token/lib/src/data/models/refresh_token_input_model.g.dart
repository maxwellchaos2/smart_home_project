// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefreshTokenInputModelImpl _$$RefreshTokenInputModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenInputModelImpl(
      token: json['token'] as String,
      expiresAt: DateTime.parse(json['expires_at'] as String),
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$$RefreshTokenInputModelImplToJson(
        _$RefreshTokenInputModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires_at': instance.expiresAt.toIso8601String(),
      'user_id': instance.userId,
    };
