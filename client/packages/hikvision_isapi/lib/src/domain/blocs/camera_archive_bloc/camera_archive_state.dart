part of 'camera_archive_bloc.dart';

@freezed
sealed class CameraArchiveState with _$CameraArchiveState {
  const factory CameraArchiveState.initial({
    List<RecordingEntity>? data,
    RecordingEntity? currentRecording,
    String? currentPlaybackUrl,
    @Default(TimeOfDay(hour: 0, minute: 0)) TimeOfDay selectedTime,
    DateTime? playbackStartTime,
    DateTime? currentPlaybackTime,
  }) = _Initial;

  const factory CameraArchiveState.loading({
    List<RecordingEntity>? data,
    RecordingEntity? currentRecording,
    String? currentPlaybackUrl,
    @Default(TimeOfDay(hour: 0, minute: 0)) TimeOfDay selectedTime,
    DateTime? playbackStartTime,
    DateTime? currentPlaybackTime,
  }) = _Loading;

  const factory CameraArchiveState.success({
    required List<RecordingEntity> data,
    RecordingEntity? currentRecording,
    String? currentPlaybackUrl,
    @Default(TimeOfDay(hour: 0, minute: 0)) TimeOfDay selectedTime,
    DateTime? playbackStartTime,
    DateTime? currentPlaybackTime,
  }) = _Success;

  const factory CameraArchiveState.failure({
    Failure? failure,
    List<RecordingEntity>? data,
    RecordingEntity? currentRecording,
    String? currentPlaybackUrl,
    @Default(TimeOfDay(hour: 0, minute: 0)) TimeOfDay selectedTime,
    DateTime? playbackStartTime,
    DateTime? currentPlaybackTime,
  }) = _Failure;
}

extension CameraArchiveStateX on CameraArchiveState {
  bool get isLoading => maybeMap(
        loading: (_) => true,
        orElse: () => false,
      );

  bool get hasData => data != null && data!.isNotEmpty;

  bool get hasError => maybeMap(
        failure: (_) => true,
        orElse: () => false,
      );

  String? get errorMessage => mapOrNull(
        failure: (state) => state.failure?.message,
      );
}
