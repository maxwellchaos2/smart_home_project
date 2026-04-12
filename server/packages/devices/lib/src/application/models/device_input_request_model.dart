import 'package:common/common.dart';

part 'device_input_request_model.freezed.dart';
part 'device_input_request_model.g.dart';

@Freezed(fromJson: true, unionKey: 'type')
sealed class DeviceInputRequestModel with _$DeviceInputRequestModel {
  const DeviceInputRequestModel._();

  const factory DeviceInputRequestModel({
    required String type,
    required String providerType,
    required String? providerDeviceId,
    required int? inputId,
    required int? outputId,
    required bool? isHidden,
    required String name,
    required List<Map<String, dynamic>> capabilities,
    required List<Map<String, dynamic>> properties,
    required int? roomId,
    required int? floorId,
    required Map<String, Object?>? customData,
  }) = _DeviceInputControllerInputRequestModel;

  @override
  factory DeviceInputRequestModel.fromJson(Map<String, Object?> json) =>
      _$DeviceInputRequestModelFromJson(json);
}

/*
{
  "type": "light",
  "name": "Светильник 1",
  "position": {
    "x": 0.79,
    "y": 0.41,
    "angle": 0.5
  },
  "capabilities": [
    {
      "type": "on_off",
      "state": {
        "instance": "on",
        "value": true
      },
      "parameters": {
        "instance": "on_off",
        "split": false
      }
    }
  ]
}
 */
