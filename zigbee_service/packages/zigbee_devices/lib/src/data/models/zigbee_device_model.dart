import 'package:common/common.dart';
import 'package:zigbee_devices/src/data/models/zigbee_device_definition_model.dart';

part 'zigbee_device_model.freezed.dart';
part 'zigbee_device_model.g.dart';

@Freezed(fromJson: true)
sealed class ZigbeeDeviceModel with _$ZigbeeDeviceModel {
  const ZigbeeDeviceModel._();

  const factory ZigbeeDeviceModel({
    /// IEEE адрес устройства
    required String ieeeAddress,

    /// Человеко-понятное имя устройства, обычно совпадает с ieeeAddress
    required String friendlyName,

    /// Флаг, указывающий, отключено ли устройство
    required bool disabled,

    /// Тип устройства (например, Coordinator, EndDevice и т.д.)
    required String type,

    /// Завершено ли интервью устройства
    /// (interview_completed = true означает, что устройство успешно опрошено и готово к использованию)
    /// interview_completed = false означает, что устройство еще не опрошено или опрос не удался
    required bool interviewCompleted,

    /// Состояние интервью устройства (например, SUCCESSFUL, FAILED и т.д.)
    required String interviewState,

    /// Флаг, указывающий, находится ли устройство в процессе интервью
    required bool interviewing,

    /// Сетевой адрес устройства
    required int networkAddress,

    /// Производитель устройства (если доступно)
    String? manufacturer,

    /// Модель устройства (если доступно)
    String? modelId,

    /// Источник питания устройства (например, Battery, Mains и т.д., если доступ
    String? powerSource,

    /// Идентификатор сборки программного обеспечения устройства (если доступно)
    /// Например, "Aug 19 2024"
    String? softwareBuildId,

    /// Код даты устройства (если доступно)
    /// Например, "202410180958"
    String? dateCode,

    /// Список конечных точек устройства и их конфигураций
    required Map<String, dynamic> endpoints,

    /// Определение устройства, включая описание, возможности и другие метаданные
    ZigbeeDeviceDefinitionModel? definition,

    /// Поддерживается ли устройство
    required bool supported,
  }) = _ZigbeeDeviceModel;

  factory ZigbeeDeviceModel.fromJson(Map<String, Object?> json) =>
      _$ZigbeeDeviceModelFromJson(json);
}
