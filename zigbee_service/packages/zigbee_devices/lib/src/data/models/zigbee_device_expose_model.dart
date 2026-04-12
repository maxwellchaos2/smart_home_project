import 'package:freezed_annotation/freezed_annotation.dart';

part 'zigbee_device_expose_model.freezed.dart';
part 'zigbee_device_expose_model.g.dart';

@Freezed(fromJson: true)
sealed class ZigbeeDeviceExposeModel with _$ZigbeeDeviceExposeModel {
  const ZigbeeDeviceExposeModel._();

  const factory ZigbeeDeviceExposeModel({
    /// Категория возможности
    String? category,

    /// Описание возможности
    required String? description,

    /// Уровень доступа к возможности (например, 1 - read, 2 - write, 3 - read/write, 5 - notify)
    required int? access,

    /// Метка возможности
    required String? label,

    /// Имя возможности
    required String? name,

    /// Свойство возможности
    required String? property,

    /// Тип возможности (например, numeric, enum, binary и т.д.)
    required String? type,

    /// Максимальное значение (если применимо, для типа numeric)
    int? valueMax,

    /// Минимальное значение (если применимо, для типа numeric)
    int? valueMin,

    /// Шаг изменения значения (если применимо, для типа numeric)
    double? valueStep,

    /// Единица измерения (если применимо, для типа numeric)
    String? unit,

    /// Список возможных значений (если применимо, для типа enum)
    List<String>? values,
  }) = _ZigbeeDeviceExposeModel;

  factory ZigbeeDeviceExposeModel.fromJson(Map<String, Object?> json) =>
      _$ZigbeeDeviceExposeModelFromJson(json);
}
