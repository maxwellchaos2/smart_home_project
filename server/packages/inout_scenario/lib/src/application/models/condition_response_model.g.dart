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

Map<String, dynamic> _$$ConditionStateResponseModelImplToJson(
        _$ConditionStateResponseModelImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'state': instance.state,
      'type': instance.$type,
    };
