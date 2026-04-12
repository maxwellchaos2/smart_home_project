// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isapi_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsapiEventModelImpl _$$IsapiEventModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IsapiEventModelImpl(
      time: DateTime.parse(json['time'] as String),
      minor: (json['minor'] as num).toInt(),
      major: (json['major'] as num).toInt(),
      name: json['name'] as String?,
    );
