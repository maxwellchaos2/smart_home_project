import 'package:common/common.dart';

part 'zigbee_device_model.freezed.dart';
part 'zigbee_device_model.g.dart';

@Freezed(fromJson: true)
sealed class ZigbeeDeviceModel with _$ZigbeeDeviceModel {
  const ZigbeeDeviceModel._();

  const factory ZigbeeDeviceModel({
    required String id,
    required String name,
    required String type,
    required List<Map<String, dynamic>> capabilities,
    required List<Map<String, dynamic>> properties,
    required bool interviewCompleted,
  }) = _ZigbeeDeviceModel;

  factory ZigbeeDeviceModel.fromJson(Map<String, Object?> json) =>
      _$ZigbeeDeviceModelFromJson(json);
}
