import 'package:common/common.dart';

import '../../domain.dart';

part 'camera_archive_bloc.freezed.dart';
part 'camera_archive_event.dart';
part 'camera_archive_state.dart';

final class CameraArchiveBloc
    extends Bloc<CameraArchiveEvent, CameraArchiveState> {
  final ICameraArchiveRepository _repository;
  final AccessInfoInputEntity _accessInfo;
  final String _trackId;

  CameraArchiveBloc({
    required ICameraArchiveRepository repository,
    required AccessInfoInputEntity accessInfo,
    required String trackId,
  })  : _repository = repository,
        _accessInfo = accessInfo,
        _trackId = trackId,
        super(CameraArchiveState.initial(
          selectedTime: TimeOfDay.now(),
        )) {
    on<CameraArchiveEvent>(
      (event, emit) => event.map(
        searchRecordings: (event) => _searchRecordings(event, emit),
        selectTime: (event) => _selectTime(event, emit),
        updatePlaybackPosition: (event) => _updatePlaybackPosition(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _searchRecordings(
    _SearchRecordings event,
    Emitter<CameraArchiveState> emit,
  ) =>
      emit.load(state, () async {
        final startTime = DateTime(
          event.date.year,
          event.date.month,
          event.date.day,
          0,
          0,
          0,
        );
        final endTime = DateTime(
          event.date.year,
          event.date.month,
          event.date.day,
          23,
          59,
          59,
        );

        final recordings = await _repository.searchRecordings(
          accessInfo: _accessInfo,
          trackId: _trackId,
          startTime: startTime,
          endTime: endTime,
        );

        emit(CameraArchiveState.success(
          data: recordings,
          selectedTime: state.selectedTime,
        ));

        // Автоматически выбираем запись для текущего времени
        if (recordings.isNotEmpty) {
          add(CameraArchiveEvent.selectTime(time: state.selectedTime));
        }
      });

  Future<void> _selectTime(
    _SelectTime event,
    Emitter<CameraArchiveState> emit,
  ) async {
    if (state.data == null || state.data!.isEmpty) return;

    final targetTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      event.time.hour,
      event.time.minute,
    );

    // Находим запись, содержащую выбранное время
    RecordingEntity? foundRecording;
    for (final recording in state.data!) {
      if (targetTime.isAfter(recording.startTime) &&
          targetTime.isBefore(recording.endTime)) {
        foundRecording = recording;
        break;
      }
    }

    // Строим playback URL если запись найдена
    final playbackUrl = foundRecording != null
        ? _buildPlaybackUrl(foundRecording, targetTime)
        : null;

    emit(state.map(
      initial: (_) => CameraArchiveState.initial(
        data: state.data,
        currentRecording: foundRecording,
        currentPlaybackUrl: playbackUrl,
        selectedTime: event.time,
        playbackStartTime: targetTime,
      ),
      loading: (_) => CameraArchiveState.loading(
        data: state.data,
        currentRecording: foundRecording,
        currentPlaybackUrl: playbackUrl,
        selectedTime: event.time,
        playbackStartTime: targetTime,
      ),
      success: (_) => CameraArchiveState.success(
        data: state.data!,
        currentRecording: foundRecording,
        currentPlaybackUrl: playbackUrl,
        selectedTime: event.time,
        playbackStartTime: targetTime,
      ),
      failure: (state) => CameraArchiveState.failure(
        failure: state.failure,
        data: state.data,
        currentRecording: foundRecording,
        currentPlaybackUrl: playbackUrl,
        selectedTime: event.time,
        playbackStartTime: targetTime,
      ),
    ));
  }

  Future<void> _updatePlaybackPosition(
    _UpdatePlaybackPosition event,
    Emitter<CameraArchiveState> emit,
  ) async {
    if (state.currentRecording == null || state.playbackStartTime == null)
      return;

    // Вычисляем реальное время: начальное время + прошедшее время воспроизведения
    final recording = state.currentRecording!;
    final realTime = state.playbackStartTime!.add(event.position);

    // Проверяем, не вышли ли мы за границы текущей записи
    if (realTime.isAfter(recording.endTime)) {
      // Переключаемся на следующую запись
      final currentIndex = state.data!.indexOf(recording);
      if (currentIndex < state.data!.length - 1) {
        final nextRecording = state.data![currentIndex + 1];
        final newTime = TimeOfDay.fromDateTime(nextRecording.startTime);
        add(CameraArchiveEvent.selectTime(time: newTime));
      }
      return;
    }

    // Обновляем selectedTime для синхронизации timeline
    final newSelectedTime = TimeOfDay.fromDateTime(realTime);

    emit(state.map(
      initial: (_) => CameraArchiveState.initial(
        data: state.data,
        currentRecording: state.currentRecording,
        currentPlaybackUrl: state.currentPlaybackUrl,
        selectedTime: newSelectedTime,
        playbackStartTime: state.playbackStartTime,
        currentPlaybackTime: realTime,
      ),
      loading: (_) => CameraArchiveState.loading(
        data: state.data,
        currentRecording: state.currentRecording,
        currentPlaybackUrl: state.currentPlaybackUrl,
        selectedTime: newSelectedTime,
        playbackStartTime: state.playbackStartTime,
        currentPlaybackTime: realTime,
      ),
      success: (_) => CameraArchiveState.success(
        data: state.data!,
        currentRecording: state.currentRecording,
        currentPlaybackUrl: state.currentPlaybackUrl,
        selectedTime: newSelectedTime,
        playbackStartTime: state.playbackStartTime,
        currentPlaybackTime: realTime,
      ),
      failure: (state) => CameraArchiveState.failure(
        failure: state.failure,
        data: state.data,
        currentRecording: state.currentRecording,
        currentPlaybackUrl: state.currentPlaybackUrl,
        selectedTime: newSelectedTime,
        playbackStartTime: state.playbackStartTime,
        currentPlaybackTime: realTime,
      ),
    ));
  }

  String _buildPlaybackUrl(RecordingEntity recording, DateTime startTime) {
    final formattedTime = _formatDateTimeForUrl(startTime);

    final baseUrl = recording.playbackUrl;
    final uri = Uri.parse(baseUrl);

    final queryParams = Map<String, String>.from(uri.queryParameters);
    queryParams['starttime'] = formattedTime;

    final newUri = uri.replace(queryParameters: queryParams);

    return newUri.toString().replaceFirst(
          'rtsp://',
          'rtsp://${_accessInfo.username}:${_accessInfo.password}@',
        );
  }

  String _formatDateTimeForUrl(DateTime dateTime) {
    final year = dateTime.year.toString();
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final second = dateTime.second.toString().padLeft(2, '0');

    return '$year$month${day}T$hour$minute${second}Z';
  }
}

extension on Emitter<CameraArchiveState> {
  Future<void> load(
      CameraArchiveState state, Future<void> Function() func) async {
    try {
      call(CameraArchiveState.loading(
        data: state.data,
        selectedTime: state.selectedTime,
      ));
      await func();
    } on Failure catch (e) {
      call(CameraArchiveState.failure(
        failure: e,
        data: state.data,
        selectedTime: state.selectedTime,
      ));
    } on Object {
      call(CameraArchiveState.failure(
        data: state.data,
        selectedTime: state.selectedTime,
      ));
      rethrow;
    }
  }
}
