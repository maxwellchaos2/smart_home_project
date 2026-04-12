import 'package:freezed_annotation/freezed_annotation.dart';

part 'recording_entity.freezed.dart';

/// Сущность записи из архива камеры Hikvision
@freezed
class RecordingEntity with _$RecordingEntity {
  const factory RecordingEntity({
    required String trackId,
    required DateTime startTime,
    required DateTime endTime,
    required String playbackUrl,
    required String contentType,
    required String codecType,
    String? sourceId,
    int? size,
  }) = _RecordingEntity;
}

/// Входные данные для поиска записей
@freezed
class RecordingSearchInputEntity with _$RecordingSearchInputEntity {
  const factory RecordingSearchInputEntity({
    required String trackId,
    required DateTime startTime,
    required DateTime endTime,
    @Default(100) int maxResults,
    @Default(0) int searchResultPosition,
  }) = _RecordingSearchInputEntity;
}

/// Результат поиска записей
@freezed
class RecordingSearchResultEntity with _$RecordingSearchResultEntity {
  const factory RecordingSearchResultEntity({
    required String searchId,
    required bool responseStatus,
    required String responseStatusString,
    required int numOfMatches,
    required List<RecordingEntity> recordings,
  }) = _RecordingSearchResultEntity;
}
