// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_scenario_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceScenarioInputModelImpl _$$DeviceScenarioInputModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceScenarioInputModelImpl(
      name: json['name'] as String,
      projectId: (json['project_id'] as num).toInt(),
      condition:
          ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      actions: (json['actions'] as List<dynamic>)
          .map((e) => ActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DeviceScenarioInputModelImplToJson(
        _$DeviceScenarioInputModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'project_id': instance.projectId,
      'condition': instance.condition.toJson(),
      'actions': instance.actions.map((e) => e.toJson()).toList(),
    };
