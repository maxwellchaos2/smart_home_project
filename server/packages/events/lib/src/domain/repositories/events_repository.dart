import 'package:events/src/domain/domain.dart';

abstract interface class IEventsRepository {
  Future<bool> createTableIfNotExists();

  Future<List<EventEntity>> fetchChunk({
    required EventsSearchInputEntity input,
  });

  Future<EventEntity> create({
    required EventInputEntity input,
  });
}
