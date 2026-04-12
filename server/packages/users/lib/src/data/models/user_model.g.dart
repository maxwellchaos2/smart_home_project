// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      createdAt: dateTimeFromJson(json['created_at'] as DateTime),
      updatedAt: dateTimeFromJson(json['updated_at'] as DateTime),
      projectsId: (json['projects_id'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      email: json['email'] as String?,
      username: json['username'] as String,
      passwordHash: json['password_hash'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'projects_id': instance.projectsId,
      'email': instance.email,
      'username': instance.username,
      'password_hash': instance.passwordHash,
    };
