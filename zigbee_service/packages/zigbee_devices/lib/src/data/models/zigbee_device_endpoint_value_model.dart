import 'package:freezed_annotation/freezed_annotation.dart';

part 'zigbee_device_endpoint_value_model.freezed.dart';
part 'zigbee_device_endpoint_value_model.g.dart';

@Freezed(fromJson: true)
sealed class ZigbeeDeviceEndpointValueModel
    with _$ZigbeeDeviceEndpointValueModel {
  const ZigbeeDeviceEndpointValueModel._();

  const factory ZigbeeDeviceEndpointValueModel({
    /// Имя конечной точки (если доступно)
    String? name,

    /// Кластеры конечной точки
    required Map<String, dynamic> clusters,

    /// Привязки конечной точки
    required List<dynamic> bindings,

    /// Настроенные отчеты конечной точки
    required List<dynamic> configuredReportings,
    List<dynamic>? scenes,
  }) = _ZigbeeDeviceEndpointValueModel;

  factory ZigbeeDeviceEndpointValueModel.fromJson(Map<String, Object?> json) =>
      _$ZigbeeDeviceEndpointValueModelFromJson(json);
}
