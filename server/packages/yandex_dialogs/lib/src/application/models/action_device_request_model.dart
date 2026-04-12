import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_device_request_model.freezed.dart';
part 'action_device_request_model.g.dart';

@Freezed(fromJson: true)
sealed class ActionDeviceRequestModel with _$ActionDeviceRequestModel {
  const ActionDeviceRequestModel._();

  const factory ActionDeviceRequestModel({
    required String id,
    required Map<String, dynamic>? customData,
    required List<Map<String, dynamic>>? capabilities,
  }) = _ActionDeviceRequestModel;

  @override
  factory ActionDeviceRequestModel.fromJson(Map<String, Object?> json) =>
      _$ActionDeviceRequestModelFromJson(json);
}
