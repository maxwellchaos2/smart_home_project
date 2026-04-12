import 'package:yandex_dialogs/src/data/data.dart';
import 'package:yandex_dialogs/src/domain/domain.dart';

final class YandexDialogsRepositoryImpl implements IYandexDialogsRepository {
  const YandexDialogsRepositoryImpl({
    required IYandexDialogsRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IYandexDialogsRemoteDatasource _remoteSource;

  @override
  Future<void> devicesStateChanged(
      {required double timestamp,
      required YandexDevicesStatesPayloadInputEntity payload}) {
    return _remoteSource.devicesStateChanged(
      timestamp: timestamp,
      payload: payload,
    );
  }
}
