// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_device_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActionDeviceRequestModel _$ActionDeviceRequestModelFromJson(
        Map<String, dynamic> json) =>
    _ActionDeviceRequestModel(
      id: json['id'] as String,
      customData: json['custom_data'] as Map<String, dynamic>?,
      capabilities: (json['capabilities'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );
