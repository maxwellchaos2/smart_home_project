import 'package:hikvision_isapi/src/data/data.dart';
import 'package:hikvision_isapi/src/domain/domain.dart';

abstract interface class IAccessControlRemoteDatasource {
  Future<IsapiEventsChunkEntity> fetchChunkEvents({
    required AccessInfoInputEntity accessInfo,
    required IsapiEventInputEntity input,
  });
}

final class AccessControlRemoteDatasourceImpl
    implements IAccessControlRemoteDatasource {
  const AccessControlRemoteDatasourceImpl(
      {required AccessControlApiClientImpl client})
      : _client = client;

  final AccessControlApiClientImpl _client;

  @override
  Future<IsapiEventsChunkEntity> fetchChunkEvents({
    required AccessInfoInputEntity accessInfo,
    required IsapiEventInputEntity input,
  }) async {
    final result = await _client.fetchChunkEvents(
      accessInfo: accessInfo,
      input: IsapiEventInputMapper.toModel(from: input),
    );
    return IsapiEventsMapper.toEntity(from: result);
  }
}
