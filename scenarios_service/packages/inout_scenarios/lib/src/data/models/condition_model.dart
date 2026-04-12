import 'package:common/common.dart';

part 'condition_model.freezed.dart';
part 'condition_model.g.dart';

@Freezed(fromJson: true, toJson: true, unionKey: 'type')
sealed class ConditionModel with _$ConditionModel {
  const ConditionModel._();

  const factory ConditionModel.logic({
    required String logic,
    required List<ConditionModel> conditions,
  }) = _Logic;

  const factory ConditionModel.state({
    int? inputId,
    int? outputId,
    required bool? state,
  }) = _Input;

  factory ConditionModel.fromJson(Map<String, Object?> json) =>
      _$ConditionModelFromJson(json);

  @override
  Map<String, Object?> toJson();
}
