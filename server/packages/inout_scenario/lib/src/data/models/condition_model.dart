import 'package:common/common.dart';

part 'condition_model.freezed.dart';
part 'condition_model.g.dart';

@Freezed(fromJson: true, toJson: true, unionKey: 'type')
sealed class ConditionModel with _$ConditionModel {
  const ConditionModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ConditionModel.logic({
    required String logic,
    required List<ConditionModel> conditions,
  }) = _ConditionLogicModel;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ConditionModel.state({
    required String deviceId,
    required bool? state,
  }) = _ConditionStateModel;

  factory ConditionModel.fromJson(Map<String, Object?> json) =>
      _$ConditionModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
