// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_out_scenario_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$InOutScenarioResponseModelImplToJson(
        _$InOutScenarioResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'condition': instance.condition.toJson(),
      'actions': instance.actions.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
