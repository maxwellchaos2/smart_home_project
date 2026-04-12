import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_result_response_model.freezed.dart';
part 'action_result_response_model.g.dart';

@Freezed(toJson: true)
sealed class ActionResultResponseModel with _$ActionResultResponseModel {
  const ActionResultResponseModel._();

  const factory ActionResultResponseModel({
    required String status,
    String? errorCode,
  }) = _ActionResultResponseModel;

  @override
  Map<String, Object?> toJson();
}

@Freezed(toJson: true)
sealed class ActionDeviceResultResponseModel
    with _$ActionDeviceResultResponseModel {
  const ActionDeviceResultResponseModel._();

  const factory ActionDeviceResultResponseModel({
    required String id,
    required ActionResultResponseModel actionResult,
  }) = _ActionDeviceResultResponseModel;

  @override
  Map<String, Object?> toJson();
}
