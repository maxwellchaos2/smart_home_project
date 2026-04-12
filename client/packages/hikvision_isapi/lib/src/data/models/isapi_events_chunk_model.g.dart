// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isapi_events_chunk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsapiEventsChunkModelImpl _$$IsapiEventsChunkModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IsapiEventsChunkModelImpl(
      totalMatches: (json['totalMatches'] as num).toInt(),
      InfoList: (json['InfoList'] as List<dynamic>)
          .map((e) => IsapiEventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
