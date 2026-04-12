import 'package:common/common.dart';
import 'package:events/src/application/models/event_socket_message_model.dart';
import 'package:web_socket_core/web_socket_core.dart';

Future<void> permitJoinZigbeeDevicesSocketHandler(
    WebSocketMessageEntity message, GetIt locator) async {
  final messages = (message.message as List<Map>).map((e) {
    return PerminJoinZigbeeDevicesEventSocketMessageModel.fromJson(e.cast());
  }).toList();
  final webSocketRepository = locator.get<IWebSocketRepository>();
  for (final msg in messages) {
    webSocketRepository.sendMessage(
      message.message,
      topic: 'smartHub-project-${msg.projectId}',
    );
  }
}
