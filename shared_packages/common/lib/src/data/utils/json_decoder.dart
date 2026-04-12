import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:dio/dio.dart';

void _jsonDecodeEntryPoint(SendPort sendPort) {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);
  receivePort.listen((message) {
    // final Stopwatch stopwatch = Stopwatch()..start();
    final result = jsonDecode(message);
    // print('jsonDecode took ${stopwatch.elapsedMilliseconds} ms');
    sendPort.send(result);
  });
}

typedef CompleterWithJson = ({Completer completer, dynamic json});

class JsonDecodeIsolate {
  final StreamController<CompleterWithJson> _events = StreamController();

  JsonDecodeIsolate._();

  static JsonDecodeIsolate? _instance;

  static JsonDecodeIsolate get instance {
    if (_instance == null) {
      _instance = JsonDecodeIsolate._();
      _instance!._runIsolate();
    }
    return _instance!;
  }

  void _runIsolate() async {
    final rcvPort = ReceivePort();
    await Isolate.spawn(
      _jsonDecodeEntryPoint,
      rcvPort.sendPort,
    );

    final Completer<SendPort> completerSendPort = Completer();

    Completer? completer;
    rcvPort.listen(
      (message) {
        if (message is SendPort) return completerSendPort.complete(message);
        if (completer?.isCompleted == true) return;
        completer?.complete(message);
      },
      cancelOnError: false,
    );

    final sendPort = await completerSendPort.future;
    _events.stream.listen(
      (event) async {
        await completer?.future;
        completer = event.completer;
        sendPort.send(event.json);
      },
      cancelOnError: false,
    );
  }

  Future<dynamic> decode(dynamic json) async {
    final completer = Completer();
    _events.add((completer: completer, json: json));
    final result = await completer.future;
    return result;
  }
}

class DioJsonTransformer extends SyncTransformer {
  DioJsonTransformer() : super(jsonDecodeCallback: jsonDecodeCallbackFunc);

  static jsonDecodeCallbackFunc(String responseText) async {
    // Taken from https://github.com/flutter/flutter/blob/135454af32477f815a7525073027a3ff9eff1bfd/packages/flutter/lib/src/services/asset_bundle.dart#L87-L93
    // 50 KB of data should take 2-3 ms to parse on a Moto G4, and about 400 μs
    // on a Pixel 4.
    if (responseText.codeUnits.length < 50 * 1024) {
      return jsonDecode(responseText);
    }
    // For strings larger than 50 KB, run the computation in an isolate to
    // avoid causing main thread jank.
    return JsonDecodeIsolate.instance.decode(responseText);
  }
}
