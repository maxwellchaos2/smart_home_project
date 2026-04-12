// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthCodeModelImpl _$$AuthCodeModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthCodeModelImpl(
      code: json['code'] as String,
      clientId: json['client_id'] as String,
      userId: (json['user_id'] as num).toInt(),
      expiresAt: dateTimeFromJson(json['expires_at']),
    );

Map<String, dynamic> _$$AuthCodeModelImplToJson(_$AuthCodeModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'client_id': instance.clientId,
      'user_id': instance.userId,
      'expires_at': instance.expiresAt.toIso8601String(),
    };
