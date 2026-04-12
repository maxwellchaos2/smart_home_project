import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikvision_isapi/src/domain/domain.dart';

part 'isapi_events_chunk_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class IsapiEventsChunkEntity with _$IsapiEventsChunkEntity {
  const factory IsapiEventsChunkEntity({
    required List<IsapiEventEntity> items,
    required int totalSize,
  }) = _IsapiEventsChunkEntity;
}
