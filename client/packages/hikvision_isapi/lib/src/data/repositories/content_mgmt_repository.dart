import 'package:hikvision_isapi/src/data/data.dart';
import 'package:hikvision_isapi/src/domain/domain.dart';

final class ContentMgmtRepositoryImpl implements IContentMgmtRepository {
  const ContentMgmtRepositoryImpl({
    required IContentMgmtRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IContentMgmtRemoteDatasource _remoteSource;

  @override
  Future<List<InputProxyChannelEntity>> fetchInputProxyChannels({
    required AccessInfoInputEntity accessInfo,
  }) async {
    return _remoteSource.fetchInputProxyChannels(
      accessInfo: accessInfo,
    );
  }
}
