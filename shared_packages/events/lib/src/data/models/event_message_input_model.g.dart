// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_message_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventMessageNeedDeviceChangeModelImpl
    _$$EventMessageNeedDeviceChangeModelImplFromJson(
            Map<String, dynamic> json) =>
        _$EventMessageNeedDeviceChangeModelImpl(
          deviceId: (json['deviceId'] as num?)?.toInt(),
          providerType: json['providerType'] as String?,
          providerDeviceId: json['providerDeviceId'] as String?,
          capabilities: (json['capabilities'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
          $type: json['type'] as String?,
        );

Map<String, dynamic> _$$EventMessageNeedDeviceChangeModelImplToJson(
    _$EventMessageNeedDeviceChangeModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('providerType', instance.providerType);
  writeNotNull('providerDeviceId', instance.providerDeviceId);
  val['capabilities'] = instance.capabilities;
  val['type'] = instance.$type;
  return val;
}

_$EventMessageDeviceCapabilitiesChangedModelImpl
    _$$EventMessageDeviceCapabilitiesChangedModelImplFromJson(
            Map<String, dynamic> json) =>
        _$EventMessageDeviceCapabilitiesChangedModelImpl(
          deviceId: (json['deviceId'] as num?)?.toInt(),
          providerType: json['providerType'] as String?,
          providerDeviceId: json['providerDeviceId'] as String?,
          capabilities: (json['capabilities'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
          $type: json['type'] as String?,
        );

Map<String, dynamic> _$$EventMessageDeviceCapabilitiesChangedModelImplToJson(
    _$EventMessageDeviceCapabilitiesChangedModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('providerType', instance.providerType);
  writeNotNull('providerDeviceId', instance.providerDeviceId);
  val['capabilities'] = instance.capabilities;
  val['type'] = instance.$type;
  return val;
}

_$EventMessageDevicePropertiesChangedModelImpl
    _$$EventMessageDevicePropertiesChangedModelImplFromJson(
            Map<String, dynamic> json) =>
        _$EventMessageDevicePropertiesChangedModelImpl(
          deviceId: (json['deviceId'] as num?)?.toInt(),
          providerType: json['providerType'] as String?,
          providerDeviceId: json['providerDeviceId'] as String?,
          properties: (json['properties'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
          $type: json['type'] as String?,
        );

Map<String, dynamic> _$$EventMessageDevicePropertiesChangedModelImplToJson(
    _$EventMessageDevicePropertiesChangedModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('providerType', instance.providerType);
  writeNotNull('providerDeviceId', instance.providerDeviceId);
  val['properties'] = instance.properties;
  val['type'] = instance.$type;
  return val;
}

_$EventMessageNewZigbeeDeviceModelImpl
    _$$EventMessageNewZigbeeDeviceModelImplFromJson(
            Map<String, dynamic> json) =>
        _$EventMessageNewZigbeeDeviceModelImpl(
          device: json['device'] as Map<String, dynamic>,
          $type: json['type'] as String?,
        );

Map<String, dynamic> _$$EventMessageNewZigbeeDeviceModelImplToJson(
        _$EventMessageNewZigbeeDeviceModelImpl instance) =>
    <String, dynamic>{
      'device': instance.device,
      'type': instance.$type,
    };

_$OnDeviceHeartbeatEventMessageInputModelImpl
    _$$OnDeviceHeartbeatEventMessageInputModelImplFromJson(
            Map<String, dynamic> json) =>
        _$OnDeviceHeartbeatEventMessageInputModelImpl(
          deviceId: (json['deviceId'] as num).toInt(),
          $type: json['type'] as String?,
        );

Map<String, dynamic> _$$OnDeviceHeartbeatEventMessageInputModelImplToJson(
        _$OnDeviceHeartbeatEventMessageInputModelImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'type': instance.$type,
    };
