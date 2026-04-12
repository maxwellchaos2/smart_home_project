import 'package:events/src/data/data.dart';
import 'package:events/src/domain/domain.dart';

abstract interface class IEventsRemoteDatasource {
  Future<void> init();

  Future<void> sendMessages({
    required List<EventMessageInputEntity> messages,
  });

  Stream<List<EventEntity>> get onEvents;

  void dispose();
}

final class EventsRemoteDatasourceImpl implements IEventsRemoteDatasource {
  const EventsRemoteDatasourceImpl({required IEventsWebsocketClient client})
      : _client = client;

  final IEventsWebsocketClient _client;

  @override
  Future<void> init() async {
    await _client.init();
  }

  @override
  Future<void> sendMessages({
    required List<EventMessageInputEntity> messages,
  }) async {
    final models =
        messages.map((m) => EventMessageInputMapper.toModel(from: m)).toList();
    await _client.sendMessages(messages: models);
  }

  @override
  Stream<List<EventEntity>> get onEvents => _client.onEvents
      .map((event) => event.map((e) => EventMapper.toEntity(from: e)).toList());

  @override
  void dispose() {
    _client.dispose();
  }
}
