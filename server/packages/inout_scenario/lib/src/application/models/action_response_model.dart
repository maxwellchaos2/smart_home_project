import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_response_model.freezed.dart';
part 'action_response_model.g.dart';

@Freezed(toJson: true, unionKey: 'type')
class ActionResponseModel with _$ActionResponseModel {
  const ActionResponseModel._();

  const factory ActionResponseModel.changeDevice({
    required String deviceId,
    required bool? state,
  }) = _ActionChangeOutputResponseModel;

  const factory ActionResponseModel.delay({
    required int seconds,
  }) = _ActionDelayResponseModel;

  @override
  Map<String, dynamic> toJson();
}
