// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationCodeModelImpl _$$VerificationCodeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationCodeModelImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      code: json['code'] as String,
      createdAt: dateTimeFromJson(json['created_at'] as DateTime),
      expiresAt: dateTimeFromJson(json['expires_at'] as DateTime),
      verifiedAt: dateTimeVFromJson(json['verified_at'] as DateTime?),
    );

Map<String, dynamic> _$$VerificationCodeModelImplToJson(
        _$VerificationCodeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'code': instance.code,
      'created_at': instance.createdAt.toIso8601String(),
      'expires_at': instance.expiresAt.toIso8601String(),
      'verified_at': instance.verifiedAt?.toIso8601String(),
    };
