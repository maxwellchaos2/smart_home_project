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

_$EventNewZigbeeDeviceModelImpl _$$EventNewZigbeeDeviceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventNewZigbeeDeviceModelImpl(
      device:
          ZigbeeDeviceModel.fromJson(json['device'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );
