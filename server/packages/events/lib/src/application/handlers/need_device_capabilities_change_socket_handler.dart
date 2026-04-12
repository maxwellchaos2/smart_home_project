import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:events/src/application/application.dart';
import 'package:events/src/application/models/event_socket_message_model.dart';
import 'package:events/src/domain/domain.dart';
import 'package:web_socket_core/web_socket_core.dart';
import 'package:yandex_auth/yandex_auth.dart';
import 'package:yandex_devices/yandex_devices.dart';

Future<void> needDeviceCapabilitiesChangeSocketHandler(
    WebSocketMessageEntity message, GetIt locator) async {
  final data = (message.message as List<Map>).map((e) {
    return NeedDeviceCapabilitiesChangeEventSocketMessageModel.fromJson(
        e.cast());
  }).toList();

  final devicesRepository = locator.get<IDevicesRepository>();
  final webSocketRepository = locator.get<IWebSocketRepository>();
  final eventsRepository = locator.get<IEventsRepository>();
  final yandexAuthRepository = locator.get<IYandexAuthRepository>();
  final yandexDevicesRepository = locator.get<IYandexDevicesRepository>();

  final List<EventEntity> events = [];
  final List<Object> messagesForSmartHub = [];
  int? projectId;
  // final List<Object> messagesForDevice = [];
  for (final item in data) {
    try {
      late final DeviceEntity needChangeDevice;
      if (item.deviceId != null)
        needChangeDevice = await devicesRepository.fetch(
          id: item.deviceId!,
        );
      else if (item.providerDeviceId != null && item.providerType != null)
        needChangeDevice = await devicesRepository.fetchByProvider(
          providerDeviceId: item.providerDeviceId!,
          providerType:
              DeviceProviderTypeMapper.toEntity(from: item.providerType!),
        );
      else
        throw ('Need deviceId or outputId for find device');
      projectId = needChangeDevice.projectId;
      if (needChangeDevice.providerType == DeviceProviderType.yandex) {
        final yandexAuthToken = await yandexAuthRepository.fetchToken(
            projectId: needChangeDevice.projectId);
        if (yandexAuthToken == null) {
          continue;
        }
        final results =
            await yandexDevicesRepository.updateDeviceCapabilitiesState(
          authToken: yandexAuthToken.accessToken,
          deviceId: needChangeDevice.providerDeviceId!,
          capabilities: item.capabilities.map((cap) {
            final data = cap.toJson();
            data['type'] = 'devices.capabilities.${data['type']}';
            return data;
          }).toList(),
        );
        final device = await devicesRepository.updateDeviceState(
          deviceId: needChangeDevice.id,
          capabilities: [
            for (final result in results)
              if (result.isDone)
                item.capabilities.firstWhere((cap) =>
                    result.type.split('.').last == cap.toJson()['type'])
          ],
        );

        events.add(
          await eventsRepository.create(
            input: EventInputEntity.deviceUpdated(device: device),
          ),
        );
      } else if ([
        DeviceProviderType.hikvision,
        DeviceProviderType.hardware,
        DeviceProviderType.logoSiemens
      ].contains(needChangeDevice.providerType)) {
        messagesForSmartHub.addAll(
          message.message as List<Map>,
        );
      } else if (needChangeDevice.providerType == DeviceProviderType.wifi) {
        if (message.device == null) {
          webSocketRepository.sendMessage(
            message.message as List<Map>,
            topic: 'device-${needChangeDevice.id}',
          );
        }
      } else {
        continue;
      }
    } catch (e) {
      print(e);
    }
  }
  if (messagesForSmartHub.isNotEmpty) {
    webSocketRepository.sendMessage(
      messagesForSmartHub,
      topic: 'smartHub-project-${projectId}',
    );
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
