// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FloorInputModelImpl _$$FloorInputModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FloorInputModelImpl(
      name: json['name'] as String,
      projectId: (json['project_id'] as num).toInt(),
      planMediaPath: json['plan_media_path'] as String?,
    );

Map<String, dynamic> _$$FloorInputModelImplToJson(
        _$FloorInputModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'project_id': instance.projectId,
      'plan_media_path': instance.planMediaPath,
    };
