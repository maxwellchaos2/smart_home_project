import 'package:events/src/application/application.dart';
import 'package:events/src/domain/domain.dart';

abstract final class EventsRequestMapper {
  static EventsSearchInputEntity toEntity(
      {required EventsRequestModel from, required int? projectId}) {
    return EventsSearchInputEntity(
      limit: from.limit,
      offset: from.offset,
      projectId: projectId,
    );
  }
}
