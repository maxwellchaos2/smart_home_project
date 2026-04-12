import 'package:events/src/domain/domain.dart';

abstract interface class IEventsRepository {
  Future<void> init();

  Future<void> sendMessages({
    required List<EventMessageInputEntity> messages,
  });

  Stream<List<EventEntity>> get onEvents;

  Stream<dynamic> get onData;

  Future<void> sinkAdd(dynamic data);

  void dispose();
}
