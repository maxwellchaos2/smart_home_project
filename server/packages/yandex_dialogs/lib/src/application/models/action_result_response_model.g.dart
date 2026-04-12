// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_result_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ActionResultResponseModelToJson(
        _ActionResultResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error_code': instance.errorCode,
    };

Map<String, dynamic> _$ActionDeviceResultResponseModelToJson(
        _ActionDeviceResultResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action_result': instance.actionResult.toJson(),
    };
