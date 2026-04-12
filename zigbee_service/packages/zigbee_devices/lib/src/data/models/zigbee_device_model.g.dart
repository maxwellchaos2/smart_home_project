// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zigbee_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ZigbeeDeviceModel _$ZigbeeDeviceModelFromJson(Map<String, dynamic> json) =>
    _ZigbeeDeviceModel(
      ieeeAddress: json['ieee_address'] as String,
      friendlyName: json['friendly_name'] as String,
      disabled: json['disabled'] as bool,
      type: json['type'] as String,
      interviewCompleted: json['interview_completed'] as bool,
      interviewState: json['interview_state'] as String,
      interviewing: json['interviewing'] as bool,
      networkAddress: (json['network_address'] as num).toInt(),
      manufacturer: json['manufacturer'] as String?,
      modelId: json['model_id'] as String?,
      powerSource: json['power_source'] as String?,
      softwareBuildId: json['software_build_id'] as String?,
      dateCode: json['date_code'] as String?,
      endpoints: json['endpoints'] as Map<String, dynamic>,
      definition: json['definition'] == null
          ? null
          : ZigbeeDeviceDefinitionModel.fromJson(
              json['definition'] as Map<String, dynamic>),
      supported: json['supported'] as bool,
    );
