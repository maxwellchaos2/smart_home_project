import 'package:common/common.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

@Freezed(fromJson: true, toJson: true, unionKey: 'type')
sealed class DeviceModel with _$DeviceModel {
  const DeviceModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DeviceModel({
    required int id,
    required String provider,
    required String? providerDeviceId,
    required String type,
    required int? inputId,
    required int? outputId,
    required String name,
    @Default(false) bool isHidden,
    required List<dynamic> capabilities,
    required List<dynamic> properties,
    @JsonKey(fromJson: fromJsonDateTime) required DateTime createdAt,
    @JsonKey(fromJson: fromJsonDateTime) required DateTime updatedAt,
    required int? roomId,
    required int? floorId,
    required int projectId,
    Map<String, Object?>? customData,
    @JsonKey(fromJson: fromJsonDateTime) required DateTime lastHeartbeat,
    required String status,
  }) = _DeviceControllerInputModel;

  factory DeviceModel.fromJson(Map<String, Object?> json) =>
      _$DeviceModelFromJson(json);

  Map<String, Object?> toJson();
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
