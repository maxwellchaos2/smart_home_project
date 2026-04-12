import 'package:common/common.dart';
import 'package:devices/devices.dart';

part 'event_input_model.freezed.dart';
part 'event_input_model.g.dart';

@Freezed(toJson: true, unionKey: 'type')
sealed class EventInputModel with _$EventInputModel {
  const EventInputModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EventInputModel.deviceCreated({
    required int deviceId,
    required DeviceModel device,
  }) = _DeviceCreated;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EventInputModel.deviceUpdated({
    required int deviceId,
    required DeviceModel device,
  }) = _DeviceUpdated;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EventInputModel.deviceDeleted({
    required int deviceId,
    required DeviceModel device,
  }) = _DeviceDeleted;

  @override
  Map<String, dynamic> toJson();
}
