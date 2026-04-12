import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:events/src/application/models/event_socket_message_model.dart';
import 'package:web_socket_core/web_socket_core.dart';

Future<void> newZigbeeDeviceSocketHandler(
    WebSocketMessageEntity message, GetIt locator) async {
  (message.message as List<Map>)
      .map((e) => NewZigbeeDeviceEventSocketMessageModel.fromJson(e.cast()));

  if (message.device?.type != DeviceType.smartHub &&
      message.device?.type != DeviceType.controlBoxHub) {
    return;
  }

  final webSocketRepository = locator.get<IWebSocketRepository>();

  webSocketRepository.sendMessage(
    message.message,
    topic: 'app-project-${message.device!.projectId}',
  );
}
