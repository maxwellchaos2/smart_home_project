import 'dart:async';

import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:devices/src/application/components/device_modal_components/door_with_lock_device_body.dart';
import 'package:hikvision_isapi/hikvision_isapi.dart';

class CameraArchiveScreen extends StatelessWidget {
  const CameraArchiveScreen({
    super.key,
    required this.device,
    required this.accessInfo,
    required this.trackId,
  });

  final DeviceEntity device;
  final AccessInfoInputEntity accessInfo;
  final String trackId;

  @override
  Widget build(BuildContext context) {
    return CameraArchiveScope(
      accessInfo: accessInfo,
      trackId: trackId,
      child: _CameraArchiveView(device: device),
    );
  }
}

class _CameraArchiveView extends StatefulWidget {
  const _CameraArchiveView({
    required this.device,
  });

  final DeviceEntity device;

  @override
  State<_CameraArchiveView> createState() => _CameraArchiveViewState();
}

class _CameraArchiveViewState extends State<_CameraArchiveView> {
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchRecordings();
    });
  }

  void _searchRecordings() {
    CameraArchiveScope.of(context).searchRecordings(date: _selectedDay);
  }

  void _showDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDay,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
      locale: const Locale('ru', 'RU'),
    );

    if (date != null) {
      setState(() {
        _selectedDay = date;
      });
      _searchRecordings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Архив ${widget.device.name}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _showDatePicker,
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CameraArchiveBloc, CameraArchiveState>(
          builder: (context, state) {
            return Column(
              children: [
                // Видео плеер
                Expanded(
                  flex: 3,
                  child: _buildVideoPlayer(state),
                ),
                // Информация о текущей записи
                if (state.currentRecording != null)
                  _buildRecordingInfo(state.currentRecording!),
                // Таймлайн
                Container(
                  height: 120,
                  color: Colors.black87,
                  child: _buildTimeline(state),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(CameraArchiveState state) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Ошибка: ${state.errorMessage}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _searchRecordings,
              child: const Text('Повторить'),
            ),
          ],
        ),
      );
    }

    if (!state.hasData) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.videocam_off, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text('Нет записей за выбранную дату'),
          ],
        ),
      );
    }

    if (state.currentPlaybackUrl == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.videocam_off, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Нет записи в ${state.selectedTime.hour.toString().padLeft(2, '0')}:${state.selectedTime.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return CameraPlayer(
      rtspUrl: state.currentPlaybackUrl!,
      onPositionChanged: (position) {
        CameraArchiveScope.of(context)
            .updatePlaybackPosition(position: position);
      },
    );
  }

  Widget _buildRecordingInfo(RecordingEntity recording) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey.shade900,
      child: Row(
        children: [
          const Icon(Icons.videocam, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            '${_formatTime(recording.startTime)} - ${_formatTime(recording.endTime)}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            _formatDuration(
              recording.endTime.difference(recording.startTime),
            ),
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(CameraArchiveState state) {
    if (!state.hasData) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatDate(_selectedDay),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Нет записей',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Заголовок с датой и временем
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _formatDate(_selectedDay),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: Colors.red.withOpacity(0.5), width: 1),
                ),
                child: Text(
                  _formatTimeWithSeconds(state),
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Таймлайн с записями
        Expanded(
          child: _TimelineWidget(
            key: const ValueKey('camera_archive_timeline'),
            recordings: state.data!,
            selectedTime: state.selectedTime,
            currentPlaybackTime: state.currentPlaybackTime,
            onTimeSelected: (time) {
              CameraArchiveScope.of(context).selectTime(time: time);
            },
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'января',
      'февраля',
      'марта',
      'апреля',
      'мая',
      'июня',
      'июля',
      'августа',
      'сентября',
      'октября',
      'ноября',
      'декабря'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  String _formatTimeWithSeconds(CameraArchiveState state) {
    // Если есть currentPlaybackTime (обновляется каждую секунду), используем его
    if (state.currentPlaybackTime != null) {
      final time = state.currentPlaybackTime!;
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}';
    }

    // Если есть playbackStartTime (при выборе времени), показываем секунды из него
    if (state.playbackStartTime != null) {
      final time = state.playbackStartTime!;
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}';
    }

    // Иначе используем selectedTime без секунд
    return '${state.selectedTime.hour.toString().padLeft(2, '0')}:${state.selectedTime.minute.toString().padLeft(2, '0')}:00';
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}

// Виджет таймлайна для выбора времени
class _TimelineWidget extends StatefulWidget {
  const _TimelineWidget({
    super.key,
    required this.recordings,
    required this.selectedTime,
    required this.onTimeSelected,
    this.currentPlaybackTime,
  });

  final List<RecordingEntity> recordings;
  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay> onTimeSelected;
  final DateTime? currentPlaybackTime;

  @override
  State<_TimelineWidget> createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<_TimelineWidget> {
  final ScrollController _scrollController = ScrollController();
  final TransformationController _transformationController =
      TransformationController();

  double _scale = 1.0;
  double get _timelineWidth => 3000.0 * _scale; // Ширина с учетом масштаба
  double get _hourWidth => 125.0 * _scale;

  Timer? _scrollDebounceTimer;
  bool _userIsScrolling = false; // Флаг: пользователь активно скроллит

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedTime(animated: false);
    });
  }

  @override
  void didUpdateWidget(_TimelineWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Автоскролл только если пользователь не трогает таймлайн
    if (!_userIsScrolling && widget.currentPlaybackTime != null) {
      _scrollToSelectedTime(animated: false);
    }
  }

  void _onScroll() {
    // Отмечаем, что пользователь активно скроллит
    _userIsScrolling = true;

    // Дебаунс для предотвращения слишком частых обновлений
    _scrollDebounceTimer?.cancel();
    _scrollDebounceTimer = Timer(const Duration(milliseconds: 150), () {
      if (!mounted || !_scrollController.hasClients) return;

      final screenWidth = MediaQuery.of(context).size.width;
      final centerPosition = _scrollController.offset + screenWidth / 2;

      // Вычисляем время из позиции скролла (то что по красной линии)
      final ratio = centerPosition / _timelineWidth;
      final totalSeconds = (ratio * 24 * 3600).round();
      final hour = (totalSeconds ~/ 3600).clamp(0, 23);
      final minute = ((totalSeconds % 3600) ~/ 60).clamp(0, 59);

      final newTime = TimeOfDay(hour: hour, minute: minute);
      if (newTime.hour != widget.selectedTime.hour ||
          newTime.minute != widget.selectedTime.minute) {
        widget.onTimeSelected(newTime);
      }

      // Сбрасываем флаг через 500ms после последнего скролла
      _scrollDebounceTimer = Timer(const Duration(milliseconds: 500), () {
        if (mounted) {
          _userIsScrolling = false;
        }
      });
    });
  }

  void _scrollToSelectedTime({required bool animated}) {
    if (!_scrollController.hasClients) return;

    // Всегда используем currentPlaybackTime если есть, иначе selectedTime
    double ratio;
    if (widget.currentPlaybackTime != null) {
      final time = widget.currentPlaybackTime!;
      final hour = time.hour;
      final minute = time.minute;
      final second = time.second;
      // Включаем секунды в расчёт для плавного движения
      ratio = (hour + minute / 60 + second / 3600) / 24;
    } else {
      // Используем selectedTime если currentPlaybackTime недоступен
      final hour = widget.selectedTime.hour;
      final minute = widget.selectedTime.minute;
      ratio = (hour + minute / 60) / 24;
    }

    // Позиция времени на таймлайне
    final targetPosition = ratio * _timelineWidth;

    // Центрируем: скролл = позиция - половина экрана
    final screenWidth = MediaQuery.of(context).size.width;
    final scrollPosition = (targetPosition - screenWidth / 2).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    if (animated) {
      _scrollController.animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      _scrollController.jumpTo(scrollPosition);
    }
  }

  double _previousScale = 1.0;

  void _handleScaleStart(ScaleStartDetails details) {
    _previousScale = _scale;
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
    if (details.scale == 1.0) return; // Игнорируем, если нет масштабирования

    setState(() {
      _scale = (_previousScale * details.scale).clamp(1.0, 10.0);
    });

    // Обновляем позицию скролла после масштабирования
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _scrollController.hasClients) {
        _scrollToSelectedTime(animated: false);
      }
    });
  }

  @override
  void dispose() {
    _scrollDebounceTimer?.cancel();
    _scrollController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Скроллируемый таймлайн с зумом
        GestureDetector(
          onScaleStart: _handleScaleStart,
          onScaleUpdate: _handleScaleUpdate,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Container(
              width: _timelineWidth,
              color: Colors.grey.shade800,
              child: Stack(
                children: [
                  // Временные метки
                  _buildTimeMarkers(),
                  // Записи
                  _buildRecordingBars(),
                ],
              ),
            ),
          ),
        ),
        // Центральный индикатор (всегда по центру экрана)
        _buildCenterIndicator(),
        // Индикатор масштаба
        _buildScaleIndicator(),
      ],
    );
  }

  Widget _buildTimeMarkers() {
    // Определяем, показывать ли минуты (при зуме > 3)
    final showMinutes = _scale > 3.0;

    if (showMinutes) {
      // При большом зуме показываем деления по 5 минут
      return Positioned.fill(
        child: Row(
          children: List.generate(24 * 12, (index) {
            // 24 часа * 12 делений по 5 минут
            final hour = index ~/ 12;
            final minute = (index % 12) * 5;
            final divisionWidth = _hourWidth / 12;

            return Container(
              width: divisionWidth,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: minute == 0 ? Colors.white24 : Colors.white12,
                    width: minute == 0 ? 2 : 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2, top: 2),
                    child: Text(
                      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        color: minute == 0 ? Colors.white70 : Colors.white54,
                        fontSize: minute == 0 ? 11 : 9,
                        fontWeight:
                            minute == 0 ? FontWeight.w500 : FontWeight.normal,
                        backgroundColor: minute == 0
                            ? Colors.black.withOpacity(0.5)
                            : Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                  // Деления по 1 минуте фоном
                  Expanded(
                    child: Row(
                      children: List.generate(5, (subIndex) {
                        if (subIndex == 0) return const SizedBox();
                        return Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.white.withOpacity(0.05),
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
    } else {
      // При обычном зуме показываем только часы с делениями по 15 минут
      return Positioned.fill(
        child: Row(
          children: List.generate(24, (index) {
            return Container(
              width: _hourWidth,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.white24,
                    width: 2,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, top: 2),
                    child: Text(
                      '${index.toString().padLeft(2, '0')}:00',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // Деления по 15 минут без подписей
                  Expanded(
                    child: Row(
                      children: List.generate(4, (subIndex) {
                        if (subIndex == 0) return const SizedBox();
                        return Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.white12,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
    }
  }

  Widget _buildScaleIndicator() {
    return Positioned(
      right: 8,
      top: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white24, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.zoom_in,
              color: Colors.white70,
              size: 16,
            ),
            const SizedBox(width: 6),
            Text(
              '${_scale.toStringAsFixed(1)}x',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordingBars() {
    return Positioned.fill(
      child: CustomPaint(
        painter: _RecordingBarsPainter(
          recordings: widget.recordings,
          timelineWidth: _timelineWidth,
        ),
      ),
    );
  }

  Widget _buildCenterIndicator() {
    return Positioned(
      left: MediaQuery.of(context).size.width / 2 - 1,
      top: 0,
      bottom: 0,
      child: Container(
        width: 2,
        color: Colors.red,
        child: Column(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(child: Container(color: Colors.red)),
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Painter для отрисовки полос записей
class _RecordingBarsPainter extends CustomPainter {
  final List<RecordingEntity> recordings;
  final double timelineWidth;

  _RecordingBarsPainter({
    required this.recordings,
    required this.timelineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    for (final recording in recordings) {
      final startRatio = _timeToRatio(recording.startTime);
      final endRatio = _timeToRatio(recording.endTime);

      final left = startRatio * timelineWidth;
      final right = endRatio * timelineWidth;
      final rect = Rect.fromLTRB(
        left,
        size.height * 0.3,
        right,
        size.height * 0.7,
      );

      canvas.drawRect(rect, paint);
    }
  }

  double _timeToRatio(DateTime time) {
    final hour = time.hour;
    final minute = time.minute;
    final second = time.second;
    return (hour + minute / 60 + second / 3600) / 24;
  }

  @override
  bool shouldRepaint(_RecordingBarsPainter oldDelegate) {
    return oldDelegate.recordings != recordings ||
        oldDelegate.timelineWidth != timelineWidth;
  }
}
