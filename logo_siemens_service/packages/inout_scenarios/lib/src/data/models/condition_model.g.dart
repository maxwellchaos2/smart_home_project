// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogicImpl _$$LogicImplFromJson(Map<String, dynamic> json) => _$LogicImpl(
      logic: json['logic'] as String,
      conditions: (json['conditions'] as List<dynamic>)
          .map((e) => ConditionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$LogicImplToJson(_$LogicImpl instance) =>
    <String, dynamic>{
      'logic': instance.logic,
      'conditions': instance.conditions.map((e) => e.toJson()).toList(),
      'type': instance.$type,
    };

_$InputImpl _$$InputImplFromJson(Map<String, dynamic> json) => _$InputImpl(
      deviceId: json['deviceId'] as String,
      state: json['state'] as bool?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$InputImplToJson(_$InputImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'state': instance.state,
      'type': instance.$type,
    };
