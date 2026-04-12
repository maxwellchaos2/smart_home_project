// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConditionLogicRequestModelImpl _$$ConditionLogicRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConditionLogicRequestModelImpl(
      logic: json['logic'] as String,
      conditions: (json['conditions'] as List<dynamic>)
          .map((e) => ConditionRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

_$ConditionStateRequestModelImpl _$$ConditionStateRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConditionStateRequestModelImpl(
      deviceId: json['deviceId'] as String,
      state: json['state'] as bool?,
      $type: json['type'] as String?,
    );
