import 'dart:convert';

import 'package:common/common.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:events/events.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';
import 'package:web_socket_core/web_socket_core.dart';
import 'package:yandex_dialogs/src/application/application.dart';
import 'package:yandex_dialogs/src/application/models/action_result_response_model.dart';

Future<Response> actionDevicesHandler(Request request) async {
  final data = jsonDecode(await request.readAsString());

  final locator = request.context['locator'] as GetIt;
  final currentUser = request.context['currentUser'] as UserEntity;

  final devicesCapabilities = [
    for (final item in data['payload']['devices'])
      ActionDeviceRequestModel.fromJson(item),
  ];

  final devicesRepository = locator.get<IDevicesRepository>();
  final webSocketRepository = locator.get<IWebSocketRepository>();
  final eventsRepository = locator.get<IEventsRepository>();

  final List<EventEntity> events = [];
  final List<Object> messagesForSmartHub = [];

  int? projectId;

  final List<ActionDeviceResultResponseModel> results = [];
  for (final item in devicesCapabilities) {
    try {
      final needChangeDevice = await devicesRepository.fetch(
        id: int.parse(item.id),
      );
      if (needChangeDevice.status == DeviceStatus.offline) {
        results.add(
          ActionDeviceResultResponseModel(
            id: item.id,
            actionResult: ActionResultResponseModel(
              status: 'ERROR',
              errorCode: 'DEVICE_UNREACHABLE',
            ),
          ),
        );
        continue;
      }
      projectId ??= needChangeDevice.projectId;
      final capabilities = item.capabilities!
          .map(
            (capability) => DeviceCapabilityEntity.fromJson(
                capabilityFromYandex(capability)),
          )
          .toList(growable: false);
      if ([DeviceProviderType.logoSiemens, DeviceProviderType.zigbee]
          .contains(needChangeDevice.providerType)) {
        messagesForSmartHub.add(
          {
            'type': 'needDeviceCapabilitiesChange',
            'deviceId': needChangeDevice.id,
            'capabilities': capabilities
                .map(
                  (cap) => cap.toJson(),
                )
                .toList()
          },
        );
      } else {
        continue;
      }

      events.add(
        await eventsRepository.create(
          input: EventInputEntity.deviceUpdated(device: needChangeDevice),
        ),
      );
      results.add(
        ActionDeviceResultResponseModel(
          id: item.id,
          actionResult: ActionResultResponseModel(
            status: 'DONE',
            errorCode: null,
          ),
        ),
      );
    } catch (e) {
      print(e);
      results.add(
        ActionDeviceResultResponseModel(
          id: item.id,
          actionResult: ActionResultResponseModel(
            status: 'ERROR',
            errorCode: e.toString(),
          ),
        ),
      );
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

  final jsonResponse = {
    'request_id': request.context['requestId'] ?? '-',
    'payload': {
      'user_id': currentUser.id,
      'devices': results.map((e) => e.toJson()).toList(),
    },
  };
  return Response.ok(
    jsonEncode(jsonResponse),
    headers: {'content-type': 'application/json'},
  );
}

Map<String, dynamic> capabilityFromYandex(
  Map<String, dynamic> capability,
) {
  final parameters = capability['parameters'] as Map<String, dynamic>?;
  final type = (capability['type'] as String).split('.').last;
  return {
    ...capability,
    'type': (capability['type'] as String).split('.').last,
    'parameters': parameters != null
        ? {
            'instance': type,
            ...parameters,
          }
        : null,
  };
}

Map<String, dynamic> propertyFromYandex(
  Map<String, dynamic> property,
) {
  final parameters = property['parameters'] as Map<String, dynamic>?;
  final type = (property['type'] as String).split('.').last;
  return {
    ...property,
    'type': (property['type'] as String).split('.').last,
    'parameters': parameters != null
        ? {
            'instance': type,
            ...parameters,
          }
        : null,
  };
}
