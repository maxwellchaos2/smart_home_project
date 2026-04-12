// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangeOutputImpl _$$ChangeOutputImplFromJson(Map<String, dynamic> json) =>
    _$ChangeOutputImpl(
      outputId: (json['outputId'] as num).toInt(),
      state: json['state'] as bool?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ChangeOutputImplToJson(_$ChangeOutputImpl instance) =>
    <String, dynamic>{
      'outputId': instance.outputId,
      'state': instance.state,
      'type': instance.$type,
    };

_$DelayImpl _$$DelayImplFromJson(Map<String, dynamic> json) => _$DelayImpl(
      seconds: (json['seconds'] as num).toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$DelayImplToJson(_$DelayImpl instance) =>
    <String, dynamic>{
      'seconds': instance.seconds,
      'type': instance.$type,
    };
