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

_$ConditionDeviceStateRequestModelImpl
    _$$ConditionDeviceStateRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ConditionDeviceStateRequestModelImpl(
          deviceId: (json['device_id'] as num).toInt(),
          state: json['state'] as Map<String, dynamic>,
          $type: json['type'] as String?,
        );

_$ConditionDeviceStateValueRequestModelImpl
    _$$ConditionDeviceStateValueRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ConditionDeviceStateValueRequestModelImpl(
          deviceId: (json['device_id'] as num).toInt(),
          state: json['state'] as Map<String, dynamic>,
          operator: json['operator'] as String,
          $type: json['type'] as String?,
        );

_$ConditionInputStateRequestModelImpl
    _$$ConditionInputStateRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$ConditionInputStateRequestModelImpl(
          inputId: (json['input_id'] as num).toInt(),
          state: json['state'] as bool?,
          $type: json['type'] as String?,
        );

_$ConditionDeviceEventRequestModelImpl
    _$$ConditionDeviceEventRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ConditionDeviceEventRequestModelImpl(
          deviceId: (json['device_id'] as num).toInt(),
          event: json['event'] as Map<String, dynamic>,
          $type: json['type'] as String?,
        );
