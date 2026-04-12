import 'package:hikvision_isapi/src/domain/domain.dart';

abstract interface class IContentMgmtRepository {
  Future<List<InputProxyChannelEntity>> fetchInputProxyChannels({
    required AccessInfoInputEntity accessInfo,
  });
}
