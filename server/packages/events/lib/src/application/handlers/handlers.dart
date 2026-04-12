import 'package:common/common.dart';
import 'package:events/src/application/handlers/new_zigbee_device_socket_handler.dart';
import 'package:events/src/application/handlers/permit_join_zigbee_devices_socket_handler.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:web_socket_core/web_socket_core.dart';

import 'device_capabilities_changed_change_socket_handler.dart';
import 'device_properties_changed_change_socket_handler.dart';
import 'need_device_capabilities_change_socket_handler.dart';
import 'on_device_heartbeat_socket_handler.dart';

void registerRouterHandlers(Router router) {
  // router.get('/api/events', fetchEventsHandler);
}

void registerWebSocketHandlers(GetIt locator) {
  locator.get<IWebSocketRepository>().onMessage.listen((message) async {
    try {
      final messages = message.message as List;
      final handlers = {
        'needDeviceCapabilitiesChange':
            needDeviceCapabilitiesChangeSocketHandler,
        'deviceCapabilitiesChanged': deviceCapabilitiesChangedSocketHandler,
        'devicePropertiesChanged': devicePropertiesChangedSocketHandler,
        'permitJoinZigbeeDevices': permitJoinZigbeeDevicesSocketHandler,
        'newZigbeeDevice': newZigbeeDeviceSocketHandler,
        'onDeviceHeartbeat': onDeviceHeartbeatSocketHandler,
      };

      for (var type in handlers.keys) {
        final filteredMessages = messages
            .where((m) => (m as Map)['type'] == type)
            .map((m) => m as Map)
            .toList();

        if (filteredMessages.isNotEmpty) {
          await handlers[type]!(
            WebSocketMessageEntity(
              user: message.user,
              device: message.device,
              message: filteredMessages,
            ),
            locator,
          );
        }
      }
    } catch (e) {
      print(e);
      final webSocketRepository = locator.get<IWebSocketRepository>();
      webSocketRepository.sendMessage(
        [
          {
            'type': 'error',
            'message': e.toString(),
          }
        ],
        topic: 'user-${message.user?.id}',
      );
    }
  });
}
