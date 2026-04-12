import 'package:common/common.dart';
import 'package:devices/devices.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@Freezed(fromJson: true, unionKey: 'type', toJson: false)
sealed class EventModel with _$EventModel {
  const EventModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EventModel.deviceCreated({
    required int id,
    required int deviceId,
    @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
    required DeviceModel device,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime createdAt,
  }) = _DeviceCreated;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EventModel.deviceUpdated({
    required int id,
    required int deviceId,
    @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
    required DeviceModel device,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime createdAt,
  }) = _DeviceUpdated;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EventModel.deviceDeleted({
    required int id,
    required int deviceId,
    @JsonKey(fromJson: deviceModelFromJson, toJson: deviceToJson)
    required DeviceModel device,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime createdAt,
  }) = _DeviceDeleted;

  factory EventModel.fromJson(Map<String, Object?> json) =>
      _$EventModelFromJson(json);
}

DateTime dateTimeFromJson(DateTime value) {
  return value;
}

DeviceModel deviceModelFromJson(Map<String, Object?> json) {
  return DeviceModel.fromJson(json);
}

int deviceToJson(DeviceModel value) {
  return value.id;
}
