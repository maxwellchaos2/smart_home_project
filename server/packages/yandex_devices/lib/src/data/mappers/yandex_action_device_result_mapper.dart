import 'package:yandex_devices/src/domain/domain.dart';

abstract final class YandexActionDeviceResultMapper {
  static List<YandexActionDeviceResultEntity> toEntity(
      {required Map<String, dynamic> from}) {
    for (final device in from['devices'] as List<dynamic>) {
      final List<YandexActionDeviceResultEntity> result = [];
      for (final capability in device['capabilities'] as List<dynamic>) {
        result.add(
          YandexActionDeviceResultEntity(
            type: capability['type'] as String,
            isDone: capability['state']['action_result']['status'] == 'DONE',
          ),
        );
      }
      return result;
    }
    return [];
  }
}
