import 'package:hikvision_isapi/src/data/data.dart';
import 'package:hikvision_isapi/src/domain/domain.dart';

abstract interface class IContentMgmtRemoteDatasource {
  Future<List<InputProxyChannelEntity>> fetchInputProxyChannels({
    required AccessInfoInputEntity accessInfo,
  });

  Future<RecordingSearchModel> searchRecordings({
    required AccessInfoInputEntity accessInfo,
    required RecordingSearchInputEntity searchInput,
  });
}

final class ContentMgmtRemoteDatasourceImpl
    implements IContentMgmtRemoteDatasource {
  const ContentMgmtRemoteDatasourceImpl({required IContentMgmtApiClient client})
      : _client = client;

  final IContentMgmtApiClient _client;

  @override
  Future<List<InputProxyChannelEntity>> fetchInputProxyChannels({
    required AccessInfoInputEntity accessInfo,
  }) async {
    final result = await _client.fetchInputProxyChannels(
      accessInfo: accessInfo,
    );
    return result
        .map((e) => InputProxyChannelMapper.toEntity(from: e))
        .toList();
  }

  @override
  Future<RecordingSearchModel> searchRecordings({
    required AccessInfoInputEntity accessInfo,
    required RecordingSearchInputEntity searchInput,
  }) async {
    return _client.searchRecordings(
      accessInfo: accessInfo,
      searchInput: searchInput,
    );
  }
}
