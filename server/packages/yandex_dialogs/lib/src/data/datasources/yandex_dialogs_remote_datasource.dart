import 'package:yandex_dialogs/src/data/data.dart';
import 'package:yandex_dialogs/src/domain/domain.dart';

abstract interface class IYandexDialogsRemoteDatasource {
  Future<void> devicesStateChanged({
    required double timestamp,
    required YandexDevicesStatesPayloadInputEntity payload,
  });
}

final class YandexDialogsRemoteDatasourceImpl
    implements IYandexDialogsRemoteDatasource {
  const YandexDialogsRemoteDatasourceImpl({required YandexDialogsClient client})
      : _client = client;

  final YandexDialogsClient _client;

  @override
  Future<void> devicesStateChanged({
    required double timestamp,
    required YandexDevicesStatesPayloadInputEntity payload,
  }) {
    final payloadModel =
        YandexDevicesStatesPayloadInputMapper.toModel(from: payload);
    return _client.devicesStateChanged(
      timestamp: timestamp,
      payload: payloadModel.toJson(),
    );
  }
}
