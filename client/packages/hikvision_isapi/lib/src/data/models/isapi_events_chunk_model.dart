import 'package:common/common.dart';
import 'package:hikvision_isapi/src/data/data.dart';

part 'isapi_events_chunk_model.freezed.dart';
part 'isapi_events_chunk_model.g.dart';

@Freezed(fromJson: true)
sealed class IsapiEventsChunkModel with _$IsapiEventsChunkModel {
  const IsapiEventsChunkModel._();

  const factory IsapiEventsChunkModel({
    required int totalMatches,
    required List<IsapiEventModel> InfoList,
  }) = _IsapiEventsChunkModel;

  factory IsapiEventsChunkModel.fromJson(Map<String, Object?> json) =>
      _$IsapiEventsChunkModelFromJson(json);
}
