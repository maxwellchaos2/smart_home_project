import 'package:common/common.dart';

part 'device_input_model.freezed.dart';
part 'device_input_model.g.dart';

@Freezed(toJson: true, unionKey: 'type')
sealed class DeviceInputModel with _$DeviceInputModel {
  const DeviceInputModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DeviceInputModel({
    required String type,
    required String provider,
    required String? providerDeviceId,
    required int? inputId,
    required int? outputId,
    required bool isHidden,
    required String name,
    required String capabilities,
    required String properties,
    required int? roomId,
    required int? floorId,
    required int projectId,
    Map<String, Object?>? customData,
  }) = _DeviceControllerInputInputModel;

  @override
  Map<String, dynamic> toJson();
}
