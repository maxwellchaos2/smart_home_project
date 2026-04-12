import 'package:hikvision_isapi/src/data/data.dart';
import 'package:hikvision_isapi/src/domain/domain.dart';

abstract final class RecordingMapper {
  static RecordingEntity toEntity(RecordingMatchItemModel model) {
    return RecordingEntity(
      trackId: model.trackId,
      startTime: model.startTime,
      endTime: model.endTime,
      playbackUrl: model.playbackUrl,
      contentType: model.contentType,
      codecType: model.codecType,
      sourceId: model.sourceId,
      size: model.size,
    );
  }

  static RecordingSearchResultEntity toSearchResultEntity(
    RecordingSearchModel model,
  ) {
    return RecordingSearchResultEntity(
      searchId: model.searchId,
      responseStatus: model.responseStatus,
      responseStatusString: model.responseStatusString,
      numOfMatches: model.numOfMatches,
      recordings: model.matchList.map(toEntity).toList(),
    );
  }

  static RecordingSearchRequestModel toRequestModel(
    RecordingSearchInputEntity input,
  ) {
    return RecordingSearchRequestModel(
      trackId: input.trackId,
      startTime: input.startTime,
      endTime: input.endTime,
      maxResults: input.maxResults,
      searchResultPosition: input.searchResultPosition,
    );
  }
}
