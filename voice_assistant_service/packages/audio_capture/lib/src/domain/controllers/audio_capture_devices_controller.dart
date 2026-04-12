import '../domain.dart';

abstract interface class IAudioCaptureDevicesController {
  AudioCaptureDevicesState get state;

  void fetch();

  Stream<AudioCaptureDevicesState> get stateChanged;

  static IAudioCaptureDevicesController create({
    required IAudioCaptureDevicesRepository repository,
    List<AudioCaptureDeviceEntity>? initData,
  }) {
    final bloc = AudioCaptureDevicesBloc(
      repository: repository,
      initData: initData,
    );
    return AudioCaptureDevicesControllerImpl(bloc: bloc);
  }
}

final class AudioCaptureDevicesControllerImpl
    implements IAudioCaptureDevicesController {
  final AudioCaptureDevicesBloc _bloc;
  const AudioCaptureDevicesControllerImpl(
      {required AudioCaptureDevicesBloc bloc})
      : _bloc = bloc;

  @override
  AudioCaptureDevicesState get state => _bloc.state;

  Stream<AudioCaptureDevicesState> get stateChanged => _bloc.stream;

  @override
  void fetch() => _bloc.add(const AudioCaptureDevicesEvent.fetch());
}
