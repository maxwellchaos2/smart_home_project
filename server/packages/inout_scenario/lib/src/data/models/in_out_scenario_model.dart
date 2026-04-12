import 'dart:convert';

import 'package:common/common.dart';
import 'package:inout_scenario/src/data/data.dart';

part 'in_out_scenario_model.freezed.dart';
part 'in_out_scenario_model.g.dart';

@Freezed(fromJson: true)
sealed class InOutScenarioModel with _$InOutScenarioModel {
  const InOutScenarioModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory InOutScenarioModel({
    required int id,
    required String name,
    @JsonKey(fromJson: fromStringConditionModel)
    required ConditionModel condition,
    @JsonKey(fromJson: fromStringActionModel)
    required List<ActionModel> actions,
    required int projectId,
    @JsonKey(fromJson: fromJsonDateTime) required DateTime createdAt,
    @JsonKey(fromJson: fromJsonDateTime) required DateTime updatedAt,
  }) = _InOutScenarioModel;

  factory InOutScenarioModel.fromJson(Map<String, Object?> json) =>
      _$InOutScenarioModelFromJson(json);
}

DateTime fromJsonDateTime(Object? json) {
  if (json is DateTime) {
    return json;
  }
  if (json is String) {
    return DateTime.parse(json);
  }
  throw ArgumentError.value(json, 'json', 'Cannot convert to DateTime');
}

ConditionModel fromStringConditionModel(dynamic json) {
  return ConditionModel.fromJson(switch (json) {
    String json => jsonDecode(json),
    _ => json,
  });
}

List<ActionModel> fromStringActionModel(dynamic json) {
  final List<dynamic> list = switch (json) {
    String json => jsonDecode(json),
    _ => json,
  };
  return list.map((e) => ActionModel.fromJson(e)).toList();
}
