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

_$ConditionStateModelImpl _$$ConditionStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConditionStateModelImpl(
      deviceId: json['device_id'] as String,
      state: json['state'] as bool?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ConditionStateModelImplToJson(
        _$ConditionStateModelImpl instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'state': instance.state,
      'type': instance.$type,
    };
