// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      createdAt: dateTimeFromJson(json['created_at'] as DateTime),
      hasYandexAuth: json['has_yandex_auth'] as bool,
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'has_yandex_auth': instance.hasYandexAuth,
      'user_id': instance.userId,
    };
