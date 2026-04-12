// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$ConditionLogicResponseModelImplToJson(
        _$ConditionLogicResponseModelImpl instance) =>
    <String, dynamic>{
      'logic': instance.logic,
      'conditions': instance.conditions.map((e) => e.toJson()).toList(),
      'type': instance.$type,
    };

Map<String, dynamic> _$$ConditionInputStateResponseModelImplToJson(
        _$ConditionInputStateResponseModelImpl instance) =>
    <String, dynamic>{
      'input_id': instance.inputId,
      'state': instance.state,
      'type': instance.$type,
    };

Map<String, dynamic> _$$ConditionDeviceStateResponseModelImplToJson(
        _$ConditionDeviceStateResponseModelImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'state': instance.state,
      'type': instance.$type,
    };

Map<String, dynamic> _$$ConditionDeviceStateValueResponseModelImplToJson(
        _$ConditionDeviceStateValueResponseModelImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'state': instance.state,
      'operator': instance.operator,
      'type': instance.$type,
    };

Map<String, dynamic> _$$ConditionDeviceEventResponseModelImplToJson(
        _$ConditionDeviceEventResponseModelImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'event': instance.event,
      'type': instance.$type,
    };
