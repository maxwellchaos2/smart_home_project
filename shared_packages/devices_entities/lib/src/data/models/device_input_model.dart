import 'package:common/common.dart';

part 'device_input_model.freezed.dart';
part 'device_input_model.g.dart';

@Freezed(toJson: true)
sealed class DeviceInputModel with _$DeviceInputModel {
  const DeviceInputModel._();

  const factory DeviceInputModel({
    required String type,
    required String providerType,
    required String? providerDeviceId,
    required int? inputId,
    required int? outputId,
    required String name,
    required List<Map<String, dynamic>> capabilities,
    required List<Map<String, dynamic>> properties,
    required int? roomId,
    required int? floorId,
  }) = _DeviceInputModel;

  @override
  Map<String, dynamic> toJson();
}
