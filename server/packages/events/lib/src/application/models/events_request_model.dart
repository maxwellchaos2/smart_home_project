import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_request_model.freezed.dart';
part 'events_request_model.g.dart';

@Freezed(fromJson: true)
class EventsRequestModel with _$EventsRequestModel {
  const EventsRequestModel._();

  const factory EventsRequestModel({
    @JsonKey(defaultValue: 100) required int limit,
    @JsonKey(defaultValue: 0) required int offset,
  }) = _EventsRequestModel;

  factory EventsRequestModel.fromJson(Map<String, Object?> json) =>
      _$EventsRequestModelFromJson(json);
}
