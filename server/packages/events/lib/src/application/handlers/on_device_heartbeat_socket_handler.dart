import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:events/events.dart';
import 'package:events/src/application/models/event_socket_message_model.dart';
import 'package:web_socket_core/web_socket_core.dart';
import 'package:yandex_dialogs/yandex_dialogs.dart';

Future<void> onDeviceHeartbeatSocketHandler(
    WebSocketMessageEntity message, GetIt locator) async {
  final messages = (message.message as List<Map>)
      .map((e) => OnDeviceHeartbeatEventSocketMessageModel.fromJson(e.cast()))
      .toList();

  final devicesRepository = locator.get<IDevicesRepository>();
  final eventsRepository = locator.get<IEventsRepository>();
  final webSocketRepository = locator.get<IWebSocketRepository>();

  for (final item in messages) {
    try {
      final oldDevice = await devicesRepository.fetch(id: item.deviceId);
      final device = await devicesRepository.onDeviceHeartbeat(
        deviceId: item.deviceId,
      );
      if (oldDevice.status == device.status) {
        continue;
      } else {
        final event = await eventsRepository.create(
          input: EventInputEntity.deviceUpdated(device: device),
        );
        webSocketRepository.sendMessage(
          [EventResponseMapper.toModel(from: event).toJson()],
          topic: 'project-${device.projectId}',
        );
        if ([DeviceProviderType.logoSiemens, DeviceProviderType.zigbee]
            .contains(device.providerType)) {
          await updateYandexDevicesStatusHandler(
            locator,
            changedDevices: [device],
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
