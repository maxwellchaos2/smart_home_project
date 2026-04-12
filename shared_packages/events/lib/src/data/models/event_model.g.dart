// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventNeedDeviceCreatedModelImpl _$$EventNeedDeviceCreatedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventNeedDeviceCreatedModelImpl(
      id: (json['id'] as num).toInt(),
      device:
          DeviceResponseModel.fromJson(json['device'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      $type: json['type'] as String?,
    );

_$EventNeedDeviceUpdatedModelImpl _$$EventNeedDeviceUpdatedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventNeedDeviceUpdatedModelImpl(
      id: (json['id'] as num).toInt(),
      device:
          DeviceResponseModel.fromJson(json['device'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      $type: json['type'] as String?,
    );

_$EventNeedDeviceDeletedModelImpl _$$EventNeedDeviceDeletedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventNeedDeviceDeletedModelImpl(
      id: (json['id'] as num).toInt(),
      device:
          DeviceResponseModel.fromJson(json['device'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      $type: json['type'] as String?,
    );

_$EventRoomCreatedModelImpl _$$EventRoomCreatedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventRoomCreatedModelImpl(
      room: RoomModel.fromJson(json['room'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      $type: json['type'] as String?,
    );

_$EventRoomUpdatedModelImpl _$$EventRoomUpdatedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventRoomUpdatedModelImpl(
      room: RoomModel.fromJson(json['room'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      $type: json['type'] as String?,
    );

_$EventRoomDeletedModelImpl _$$EventRoomDeletedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventRoomDeletedModelImpl(
      room: RoomModel.fromJson(json['room'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      $type: json['type'] as String?,
    );

_$EventNeedDeviceCapabilitiesChangeModelImpl
    _$$EventNeedDeviceCapabilitiesChangeModelImplFromJson(
            Map<String, dynamic> json) =>
        _$EventNeedDeviceCapabilitiesChangeModelImpl(
          deviceId: (json['deviceId'] as num).toInt(),
          capabilities: (json['capabilities'] as List<dynamic>)
              .map((e) =>
                  DeviceCapabilityEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
          $type: json['type'] as String?,
        );

_$EventDeviceStateChangedModelImpl _$$EventDeviceStateChangedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventDeviceStateChangedModelImpl(
      deviceId: (json['deviceId'] as num).toInt(),
      deviceCapabilities: (json['deviceCapabilities'] as List<dynamic>?)
          ?.map(
              (e) => DeviceCapabilityEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      deviceProperties: (json['deviceProperties'] as List<dynamic>?)
          ?.map((e) => DevicePropertyEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

_$EventNeedRunDeviceScenarioModelImpl
    _$$EventNeedRunDeviceScenarioModelImplFromJson(Map<String, dynamic> json) =>
        _$EventNeedRunDeviceScenarioModelImpl(
          scenarioId: (json['scenarioId'] as num).toInt(),
          $type: json['type'] as String?,
        );

_$EventPermitJoinZigbeeDevicesModelImpl
    _$$EventPermitJoinZigbeeDevicesModelImplFromJson(
            Map<String, dynamic> json) =>
        _$EventPermitJoinZigbeeDevicesModelImpl(
          value: json['value'] as bool,
          time: (json['time'] as num).toInt(),
          $type: json['type'] as String?,
        );
