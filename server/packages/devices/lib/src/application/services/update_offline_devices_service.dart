import 'dart:async';

import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:events/events.dart';
import 'package:web_socket_core/web_socket_core.dart';
import 'package:yandex_dialogs/yandex_dialogs.dart';

class UpdateOfflineDevicesService {
  UpdateOfflineDevicesService({
    required GetIt locator,
  }) : _locator = locator;

  final GetIt _locator;
  late final Timer offlineCheckTimer;

  void start() {
    offlineCheckTimer = Timer.periodic(const Duration(seconds: 10), (_) async {
      try {
        await _updateOfflineDevices();
      } catch (e) {
        print('UpdateOfflineDevicesService error: $e');
      }
    });
  }

  Future<void> _updateOfflineDevices() async {
    final _devicesRepository = _locator.get<IDevicesRepository>();
    final newOfflineDevices = await _devicesRepository.updateOfflineDevices();
    if (newOfflineDevices.isEmpty) return;
    try {
      await updateYandexDevicesStatusHandler(
        _locator,
        changedDevices: newOfflineDevices
            .where((device) => [
                  DeviceProviderType.logoSiemens,
                  DeviceProviderType.zigbee
                ].contains(device.providerType))
            .toList(),
      );
    } catch (e) {
      print('Error updating Yandex devices status: $e');
    }

    await updateDevicesEvents(
      _locator,
      devices: newOfflineDevices,
    );

    await updateDevicesEvents(
      _locator,
      devices: newOfflineDevices,
    );
  }
}

Future<void> updateDevicesEvents(
  GetIt locator, {
  required List<DeviceEntity> devices,
}) async {
  final eventsRepository = locator.get<IEventsRepository>();
  final webSocketRepository = locator.get<IWebSocketRepository>();

  final Map<int, List<EventEntity>> projectEvents = {};

  for (final device in devices) {
    try {
      final event = await eventsRepository.create(
        input: EventInputEntity.deviceUpdated(device: device),
      );
      if (projectEvents.containsKey(device.projectId)) {
        projectEvents[device.projectId]!.add(event);
      } else {
        projectEvents[device.projectId] = [event];
      }
    } catch (e) {
      print('Error updating device events: $e');
    }
  }

  for (final entry in projectEvents.entries) {
    final projectId = entry.key;
    final events = entry.value;

    webSocketRepository.sendMessage(
      events.map((e) => EventResponseMapper.toModel(from: e).toJson()).toList(),
      topic: 'project-$projectId',
    );
  }
}
