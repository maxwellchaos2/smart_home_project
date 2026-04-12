import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class YandexDeviceMapper {
  static YandexDeviceEntity toEntity({required YandexDeviceModel from}) {
    return YandexDeviceEntity(
      id: from.id,
      name: from.name,
      type: from.type,
      capabilities: from.capabilities,
      properties: from.properties,
    );
  }
}
