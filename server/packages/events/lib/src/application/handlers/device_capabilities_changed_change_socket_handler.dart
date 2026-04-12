import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:events/events.dart';
import 'package:events/src/application/models/event_socket_message_model.dart';
import 'package:web_socket_core/web_socket_core.dart';

Future<void> deviceCapabilitiesChangedSocketHandler(
    WebSocketMessageEntity message, GetIt locator) async {
  final data = (message.message as List<Map>).map((e) {
    return DeviceCapabilitiesChangedEventSocketMessageModel.fromJson(e.cast());
  }).toList();

  final devicesRepository = locator.get<IDevicesRepository>();
  final eventsRepository = locator.get<IEventsRepository>();
  final webSocketRepository = locator.get<IWebSocketRepository>();
  final List<EventEntity> events = [];
  int? projectId;
  for (final item in data) {
    try {
      late final DeviceEntity deviceForChanged;
      if (item.deviceId != null)
        deviceForChanged = await devicesRepository.fetch(
          id: item.deviceId!,
        );
      else if (item.providerDeviceId != null && item.providerType != null)
        deviceForChanged = await devicesRepository.fetchByProvider(
          providerDeviceId: item.providerDeviceId!,
          providerType:
              DeviceProviderTypeMapper.toEntity(from: item.providerType!),
        );
      else
        throw ('Need deviceId or outputId for find device');

      final device = await devicesRepository.updateDeviceState(
        deviceId: deviceForChanged.id,
        capabilities: item.capabilities,
      );
      projectId = device.projectId;
      events.add(
        await eventsRepository.create(
          input: EventInputEntity.deviceUpdated(device: device),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
  if (events.isNotEmpty) {
    webSocketRepository.sendMessage(
      events
          .map((event) => EventResponseMapper.toModel(from: event).toJson())
          .toList(),
      topic: 'project-${projectId}',
    );
  }
}
