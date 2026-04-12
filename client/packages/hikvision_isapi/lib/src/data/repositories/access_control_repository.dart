import 'package:hikvision_isapi/src/data/data.dart';
import 'package:hikvision_isapi/src/domain/domain.dart';

final class AccessControlRepositoryImpl implements IAccessControlRepository {
  const AccessControlRepositoryImpl({
    required IAccessControlRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IAccessControlRemoteDatasource _remoteSource;

  @override
  Future<IsapiEventsChunkEntity> fetchChunkEvents({
    required AccessInfoInputEntity accessInfo,
    required IsapiEventInputEntity input,
  }) async {
    return _remoteSource.fetchChunkEvents(
      accessInfo: accessInfo,
      input: input,
    );
  }
}
