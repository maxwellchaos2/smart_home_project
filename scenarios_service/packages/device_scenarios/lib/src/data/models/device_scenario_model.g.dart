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
      condition:
          ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      actions: (json['actions'] as List<dynamic>)
          .map((e) => ActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
