// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_out_scenario_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InOutScenarioInputModelImpl _$$InOutScenarioInputModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InOutScenarioInputModelImpl(
      name: json['name'] as String,
      condition:
          ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      actions: (json['actions'] as List<dynamic>)
          .map((e) => ActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectId: (json['project_id'] as num).toInt(),
    );

Map<String, dynamic> _$$InOutScenarioInputModelImplToJson(
        _$InOutScenarioInputModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'condition': instance.condition.toJson(),
      'actions': instance.actions.map((e) => e.toJson()).toList(),
      'project_id': instance.projectId,
    };
