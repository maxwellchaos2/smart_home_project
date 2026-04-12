import 'package:common/common.dart';

part 'events_search_input_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class EventsSearchInputEntity with _$EventsSearchInputEntity {
  const factory EventsSearchInputEntity({
    required int limit,
    required int offset,
    required int? projectId,
  }) = _EventsSearchInputEntity;
}
