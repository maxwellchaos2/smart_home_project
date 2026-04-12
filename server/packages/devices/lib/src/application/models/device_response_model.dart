import 'package:common/common.dart';

part 'device_response_model.freezed.dart';
part 'device_response_model.g.dart';

@Freezed(toJson: true, unionKey: 'type')
sealed class DeviceResponseModel with _$DeviceResponseModel {
  const DeviceResponseModel._();

  const factory DeviceResponseModel({
    required int id,
    required String providerType,
    required String? providerDeviceId,
    required String type,
    required int? inputId,
    required int? outputId,
    required String name,
    required bool isHidden,
    required List<Map<String, dynamic>> capabilities,
    required List<Map<String, dynamic>> properties,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int? roomId,
    required int? floorId,
    required int projectId,
    required Map<String, Object?>? customData,
    required DateTime lastHeartbeat,
    required String status,
  }) = _DeviceResponseModel;

  @override
  Map<String, Object?> toJson();
}
