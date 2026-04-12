// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FloorModelImpl _$$FloorModelImplFromJson(Map<String, dynamic> json) =>
    _$FloorModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      projectId: (json['project_id'] as num).toInt(),
      createdAt: dateTimeFromJson(json['created_at'] as DateTime),
      updatedAt: dateTimeFromJson(json['updated_at'] as DateTime),
      planMediaPath: json['plan_media_path'] as String?,
    );

Map<String, dynamic> _$$FloorModelImplToJson(_$FloorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'project_id': instance.projectId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'plan_media_path': instance.planMediaPath,
    };
