import 'package:yandex_dialogs/src/domain/domain.dart';

abstract interface class IYandexDialogsRepository {
  Future<void> devicesStateChanged({
    required double timestamp,
    required YandexDevicesStatesPayloadInputEntity payload,
  });
}
