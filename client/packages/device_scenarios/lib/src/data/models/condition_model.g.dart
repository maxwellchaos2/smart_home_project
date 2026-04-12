// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConditionLogicModelImpl _$$ConditionLogicModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConditionLogicModelImpl(
      logic: json['logic'] as String,
      conditions: (json['conditions'] as List<dynamic>)
          .map((e) => ConditionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ConditionLogicModelImplToJson(
        _$ConditionLogicModelImpl instance) =>
    <String, dynamic>{
      'logic': instance.logic,
      'conditions': instance.conditions.map((e) => e.toJson()).toList(),
      'type': instance.$type,
    };

_$ConditionDeviceStateModelImpl _$$ConditionDeviceStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConditionDeviceStateModelImpl(
      deviceId: (json['device_id'] as num).toInt(),
      state: json['state'] as Map<String, dynamic>,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ConditionDeviceStateModelImplToJson(
        _$ConditionDeviceStateModelImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'state': instance.state,
      'type': instance.$type,
    };

_$ConditionDeviceStateValueModelImpl
    _$$ConditionDeviceStateValueModelImplFromJson(Map<String, dynamic> json) =>
        _$ConditionDeviceStateValueModelImpl(
          deviceId: (json['device_id'] as num).toInt(),
          state: json['state'] as Map<String, dynamic>,
          operator: json['operator'] as String,
          $type: json['type'] as String?,
        );

Map<String, dynamic> _$$ConditionDeviceStateValueModelImplToJson(
        _$ConditionDeviceStateValueModelImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'state': instance.state,
      'operator': instance.operator,
      'type': instance.$type,
    };

_$ConditionDeviceEventModelImpl _$$ConditionDeviceEventModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConditionDeviceEventModelImpl(
      deviceId: (json['device_id'] as num).toInt(),
      event: Map<String, String?>.from(json['event'] as Map),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ConditionDeviceEventModelImplToJson(
        _$ConditionDeviceEventModelImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'event': instance.event,
      'type': instance.$type,
    };

_$ConditionInputStateModelImpl _$$ConditionInputStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConditionInputStateModelImpl(
      inputId: (json['input_id'] as num).toInt(),
      state: json['state'] as bool?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ConditionInputStateModelImplToJson(
        _$ConditionInputStateModelImpl instance) =>
    <String, dynamic>{
      'input_id': instance.inputId,
      'state': instance.state,
      'type': instance.$type,
    };
