import 'package:common/common.dart';

import '../../domain.dart';

part 'audio_capture_devices_bloc.freezed.dart';
part 'audio_capture_devices_event.dart';
part 'audio_capture_devices_state.dart';

final class AudioCaptureDevicesBloc
    extends Bloc<AudioCaptureDevicesEvent, AudioCaptureDevicesState> {
  final IAudioCaptureDevicesRepository _repository;

  AudioCaptureDevicesBloc({
    required IAudioCaptureDevicesRepository repository,
    List<AudioCaptureDeviceEntity>? initData,
  })  : _repository = repository,
        super(AudioCaptureDevicesState.initial(data: initData)) {
    on<AudioCaptureDevicesEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
      ),
    );
  }

  Future<void> _fetch(_Fetch event, Emitter<AudioCaptureDevicesState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetchAvailableDevices();
        emit(AudioCaptureDevicesState.success(data: data));
      });
}

extension on Emitter<AudioCaptureDevicesState> {
  Future<void> load(
      AudioCaptureDevicesState state, Future<void> Function() func) async {
    try {
      call(AudioCaptureDevicesState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(AudioCaptureDevicesState.failure(failure: e, data: state.data));
    } on Object {
      call(AudioCaptureDevicesState.failure(data: state.data));
      rethrow;
    }
  }
}
