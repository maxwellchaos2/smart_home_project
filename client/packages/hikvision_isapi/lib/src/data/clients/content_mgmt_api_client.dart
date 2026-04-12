import 'package:hikvision_isapi/src/data/data.dart';
import 'package:hikvision_isapi/src/domain/domain.dart';

abstract interface class IContentMgmtApiClient {
  Future<List<InputProxyChannelModel>> fetchInputProxyChannels({
    required AccessInfoInputEntity accessInfo,
  });

  Future<RecordingSearchModel> searchRecordings({
    required AccessInfoInputEntity accessInfo,
    required RecordingSearchInputEntity searchInput,
  });
}

final class ContentMgmtApiClientImpl implements IContentMgmtApiClient {
  const ContentMgmtApiClientImpl();

  @override
  Future<List<InputProxyChannelModel>> fetchInputProxyChannels({
    required AccessInfoInputEntity accessInfo,
  }) async {
    final url =
        'http://${accessInfo.ipAddress}:${accessInfo.port}/ISAPI/ContentMgmt/InputProxy/channels';
    final isapiClient = ISAPIClientImpl(
      getClient: () => DigestAuthClient(
        accessInfo.username,
        accessInfo.password,
      ),
      url: url,
    );
    final response = await isapiClient.get();
    final channelsData =
        response['InputProxyChannelList'] as Map<String, dynamic>?;
    if (channelsData == null) {
      return [];
    }
    final values = channelsData.values;
    print(values);
    return channelsData.values
        .map((e) => InputProxyChannelModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<RecordingSearchModel> searchRecordings({
    required AccessInfoInputEntity accessInfo,
    required RecordingSearchInputEntity searchInput,
  }) async {
    final url =
        'http://${accessInfo.ipAddress}:${accessInfo.port}/ISAPI/ContentMgmt/search';

    final isapiClient = ISAPIClientImpl(
      getClient: () => DigestAuthClient(
        accessInfo.username,
        accessInfo.password,
      ),
      url: url,
    );

    // Создаем XML запрос
    final requestModel = RecordingMapper.toRequestModel(searchInput);
    final xmlBody = requestModel.toXml();

    // Отправляем POST запрос с XML телом
    final responseXml = await isapiClient.postXml(xmlBody);

    // Парсим XML ответ
    return RecordingSearchModel.fromXml(responseXml);
  }
}
