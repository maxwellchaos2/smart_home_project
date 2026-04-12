// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_state_input_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DevicesStateInputRequestModel _$DevicesStateInputRequestModelFromJson(
        Map<String, dynamic> json) =>
    _DevicesStateInputRequestModel(
      devices: (json['devices'] as List<dynamic>)
          .map((e) =>
              DeviceStateInputRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_DeviceStateInputRequestModel _$DeviceStateInputRequestModelFromJson(
        Map<String, dynamic> json) =>
    _DeviceStateInputRequestModel(
      id: json['id'] as String,
      customData: json['custom_data'] as Map<String, dynamic>?,
    );
