// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_out_scenario_input_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InOutScenarioInputRequestModelImpl
    _$$InOutScenarioInputRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$InOutScenarioInputRequestModelImpl(
          name: json['name'] as String,
          condition: ConditionRequestModel.fromJson(
              json['condition'] as Map<String, dynamic>),
          actions: (json['actions'] as List<dynamic>)
              .map(
                  (e) => ActionRequestModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
