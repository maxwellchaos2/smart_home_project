part of 'camera_archive_bloc.dart';

@freezed
sealed class CameraArchiveEvent with _$CameraArchiveEvent {
  const factory CameraArchiveEvent.searchRecordings({
    required DateTime date,
  }) = _SearchRecordings;

  const factory CameraArchiveEvent.selectTime({
    required TimeOfDay time,
  }) = _SelectTime;

  const factory CameraArchiveEvent.updatePlaybackPosition({
    required Duration position,
  }) = _UpdatePlaybackPosition;
}
