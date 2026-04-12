import 'dart:async';
import 'dart:typed_data';

import 'package:audio_capture/src/data/clients/voice_recorder.dart';

class ChunkedVoiceRecorder {
  final StreamController<Uint8List> _chunkedStreamController =
      StreamController<Uint8List>.broadcast();
  Stream<Uint8List> get audioStream => _chunkedStreamController.stream;

  final VoiceRecorder _recorder;
  final int chunkSize;

  List<int> _buffer = [];

  ChunkedVoiceRecorder(this._recorder, {this.chunkSize = 3200}) {
    _recorder.audioStream.listen(_onData);
  }

  void _onData(Uint8List data) {
    _buffer.addAll(data);

    while (_buffer.length >= chunkSize) {
      final chunk = _buffer.sublist(0, chunkSize);
      _buffer = _buffer.sublist(chunkSize);
      _chunkedStreamController.add(Uint8List.fromList(chunk));
    }
  }

  Future<void> start() async => _recorder.startRecording();
  Future<void> stop() async {
    await _recorder.dispose();
    if (_buffer.isNotEmpty) {
      _chunkedStreamController.add(Uint8List.fromList(_buffer));
      _buffer.clear();
    }
    await _chunkedStreamController.close();
  }
}
