import 'package:events/src/data/data.dart';
import 'package:events/src/domain/domain.dart';

final class EventsRepositoryImpl implements IEventsRepository {
  const EventsRepositoryImpl({
    required IEventsRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IEventsRemoteDatasource _remoteSource;

  @override
  Future<void> init() async {
    await _remoteSource.init();
  }

  @override
  Future<void> sendMessages({
    required List<EventMessageInputEntity> messages,
  }) async {
    await _remoteSource.sendMessages(messages: messages);
  }

  @override
  Stream<List<EventEntity>> get onEvents => _remoteSource.onEvents;

  @override
  Stream<dynamic> get onData => _remoteSource.onData;

  @override
  Future<void> sinkAdd(dynamic data) async {
    await _remoteSource.sinkAdd(data);
  }

  @override
  void dispose() {
    _remoteSource.dispose();
  }
}
