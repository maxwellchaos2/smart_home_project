// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// class SyncServiceClient {
//   final String url;

//   SyncServiceClient(this.url);

//   StreamController<Map<String, dynamic>> eventsController =
//       StreamController.broadcast();

//   void startBroadcast() async {
//     WebSocket? syncServiceWebSocket;

//     StreamSubscription? remoteSubscription;

//     while (true) {
//       try {
//         syncServiceWebSocket = await WebSocket.connect(
//           Uri.parse('$url/ws').replace(scheme: 'ws').toString(),
//         );
//         print('Connected to WebSocket');
//         pingWebSocket(syncServiceWebSocket);

//         remoteSubscription = syncServiceWebSocket.listen(
//           (event) async {
//             print('Received message: $event');
//             try {
//               final events = jsonDecode(event);
//               if (events is List) {
//                 eventsController.add(event);
//               }
//             } catch (e) {
//               print('Error processing message: $e');
//             }
//           },
//           onDone: () {
//             print('WebSocket connection closed');
//             syncServiceWebSocket?.close(1);
//           },
//           onError: (error) {
//             print('WebSocket error: $error');
//             syncServiceWebSocket?.close(1);
//           },
//         );

//         // Ожидание закрытия соединения
//         await syncServiceWebSocket.done;
//       } catch (e) {
//         print('Failed to connect to WebSocket: $e');
//       } finally {
//         await remoteSubscription?.cancel();
//         await syncServiceWebSocket?.close(1);
//         remoteSubscription = null;
//         syncServiceWebSocket = null;
//       }

//       // Задержка перед повторной попыткой подключения
//       await Future.delayed(Duration(seconds: 1));
//     }
//   }

//   void pingWebSocket(WebSocket webSocket) {
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       if (webSocket.readyState == WebSocket.open &&
//           webSocket.closeCode == null) {
//         webSocket.add('ping');
//       } else {
//         timer.cancel();
//       }
//     });
//   }
// }
