// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_scenario_input_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceScenarioInputRequestModelImpl
    _$$DeviceScenarioInputRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$DeviceScenarioInputRequestModelImpl(
          name: json['name'] as String,
          condition: ConditionRequestModel.fromJson(
              json['condition'] as Map<String, dynamic>),
          actions: (json['actions'] as List<dynamic>)
              .map(
                  (e) => ActionRequestModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
