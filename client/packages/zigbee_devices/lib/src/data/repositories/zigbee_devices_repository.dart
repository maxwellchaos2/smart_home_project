import 'package:common/common.dart';
import 'package:events/events.dart';
import 'package:zigbee_devices/src/domain/domain.dart';

final class ZigbeeDevicesRepositoryImpl implements IZigbeeDevicesRepository {
  const ZigbeeDevicesRepositoryImpl({
    required IEventsRepository eventsRepository,
  }) : _eventsRepository = eventsRepository;

  final IEventsRepository _eventsRepository;

  @override
  Stream<ZigbeeDeviceEntity> get onZigbeeDeviceFound =>
      _eventsRepository.onEvents
          .map((es) {
            return es.firstWhereOrNull(
              (e) => e is NewZigbeeDeviceEventEntity,
            );
          })
          .whereType<NewZigbeeDeviceEventEntity>()
          .map((e) => e.device);

  @override
  Future<void> startSearchZigbeeDevices({
    required int projectId,
  }) async {
    final seconds = 4 * 60; // 1 minute
    await _eventsRepository.sendMessages(messages: [
      EventMessageInputEntity.permitJoinZigbeeDevices(
        projectId: projectId,
        value: true,
        time: seconds,
      ),
    ]);
    await Future.delayed(Duration(seconds: seconds));
  }

  @override
  Future<void> stopSearchZigbeeDevices({
    required int projectId,
  }) {
    return _eventsRepository.sendMessages(messages: [
      EventMessageInputEntity.permitJoinZigbeeDevices(
        projectId: projectId,
        value: false,
        time: 0,
      ),
    ]);
  }
}
