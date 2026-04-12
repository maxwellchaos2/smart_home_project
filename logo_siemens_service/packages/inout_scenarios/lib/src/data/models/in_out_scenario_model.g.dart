// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_out_scenario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InOutScenarioModelImpl _$$InOutScenarioModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InOutScenarioModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      condition:
          ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      actions: (json['actions'] as List<dynamic>)
          .map((e) => ActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
