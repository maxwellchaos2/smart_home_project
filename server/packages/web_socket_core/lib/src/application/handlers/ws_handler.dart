import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:users/users.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_core/src/domain/repositories/repositories.dart';

Future<Response> wsHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IWebSocketRepository>();
  final user = request.context['currentUser'] as UserEntity?;
  final device = request.context['currentDevice'] as DeviceEntity?;
  return webSocketHandler((WebSocketChannel socketChannel) {
    repository.addChannel(socketChannel, user: user, device: device);

    // repository.sendMessage(
    //   {
    //     'message': 'New connection from ${Isolate.current.debugName}',
    //     'userId': user.id
    //   },
    //   currentSocketChannel: socketChannel,
    // );

    if (device != null) {
      repository.subscribe(
        channel: socketChannel,
        topic: 'device-${device.id}',
      );
      if ([DeviceType.smartHub, DeviceType.controlBoxHub]
          .contains(device.type)) {
        repository.subscribe(
          channel: socketChannel,
          topic: 'project-${device.projectId}',
        );
        repository.subscribe(
          channel: socketChannel,
          topic: 'smartHub-project-${device.projectId}',
        );
      }
      print('[WebSocket]: Device #${device.id} connected');
    } else if (user != null) {
      for (final projectId in user.projectsId) {
        repository.subscribe(
          channel: socketChannel,
          topic: 'project-$projectId',
        );
        repository.subscribe(
          channel: socketChannel,
          topic: 'app-project-${projectId}',
        );
      }
      repository.subscribe(
        channel: socketChannel,
        topic: 'user-${user.id}',
      );

      print('[WebSocket]: User #${user.id} connected');
    }

    socketChannel.stream.listen(
      (message) {
        if (message is String && message == 'ping') {
          // socketChannel.sink.add('pong');
          return;
        }
        repository.$onMessageReceived(
          message,
          currentSocketChannel: socketChannel,
        );
      },
      onDone: () {
        if (user != null) {
          print('[WebSocket]: User #${user.id} disconnected');
        } else if (device != null) {
          print('[WebSocket]: Device #${device.id} disconnected');
        }
        repository.removeChannel(socketChannel);
      },
    );
  })(request);
}
