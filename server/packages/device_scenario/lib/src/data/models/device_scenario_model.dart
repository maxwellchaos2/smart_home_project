import 'dart:convert';

import 'package:common/common.dart';
import 'package:device_scenario/src/data/data.dart';

part 'device_scenario_model.freezed.dart';
part 'device_scenario_model.g.dart';

@Freezed(fromJson: true)
sealed class DeviceScenarioModel with _$DeviceScenarioModel {
  const DeviceScenarioModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DeviceScenarioModel({
    required int id,
    required String name,
    @JsonKey(fromJson: fromStringConditionModel)
    required ConditionModel condition,
    @JsonKey(fromJson: fromStringActionModel)
    required List<ActionModel> actions,
    required int projectId,
    @JsonKey(fromJson: fromJsonDateTime) required DateTime createdAt,
    @JsonKey(fromJson: fromJsonDateTime) required DateTime updatedAt,
  }) = _DeviceScenarioModel;

  factory DeviceScenarioModel.fromJson(Map<String, Object?> json) =>
      _$DeviceScenarioModelFromJson(json);
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
