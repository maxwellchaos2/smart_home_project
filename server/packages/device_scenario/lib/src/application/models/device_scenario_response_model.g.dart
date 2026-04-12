// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_scenario_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$DeviceScenarioResponseModelImplToJson(
        _$DeviceScenarioResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'condition': instance.condition.toJson(),
      'actions': instance.actions.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
