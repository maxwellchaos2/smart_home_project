import 'package:hikvision_isapi/src/data/data.dart';
import 'package:hikvision_isapi/src/domain/domain.dart';

final class CameraArchiveRepositoryImpl implements ICameraArchiveRepository {
  const CameraArchiveRepositoryImpl({
    required IContentMgmtRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IContentMgmtRemoteDatasource _remoteSource;

  @override
  Future<List<RecordingEntity>> searchRecordings({
    required AccessInfoInputEntity accessInfo,
    required String trackId,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    final searchInput = RecordingSearchInputEntity(
      trackId: trackId,
      startTime: startTime,
      endTime: endTime,
    );

    final result = await _remoteSource.searchRecordings(
      accessInfo: accessInfo,
      searchInput: searchInput,
    );

    return RecordingMapper.toSearchResultEntity(result).recordings;
  }
}
