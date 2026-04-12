import 'package:hikvision_isapi/hikvision_isapi.dart';

abstract interface class ICameraArchiveRepository {
  /// Поиск записей за указанный период
  Future<List<RecordingEntity>> searchRecordings({
    required AccessInfoInputEntity accessInfo,
    required String trackId,
    required DateTime startTime,
    required DateTime endTime,
  });
}
