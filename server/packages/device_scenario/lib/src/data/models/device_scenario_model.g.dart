// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_scenario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceScenarioModelImpl _$$DeviceScenarioModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceScenarioModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      condition: fromStringConditionModel(json['condition']),
      actions: fromStringActionModel(json['actions']),
      projectId: (json['project_id'] as num).toInt(),
      createdAt: fromJsonDateTime(json['created_at']),
      updatedAt: fromJsonDateTime(json['updated_at']),
    );

Map<String, dynamic> _$$DeviceScenarioModelImplToJson(
        _$DeviceScenarioModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'condition': instance.condition.toJson(),
      'actions': instance.actions.map((e) => e.toJson()).toList(),
      'project_id': instance.projectId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
