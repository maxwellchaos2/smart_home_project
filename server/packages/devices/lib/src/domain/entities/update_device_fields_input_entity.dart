import 'package:common/common.dart';

part 'update_device_fields_input_entity.freezed.dart';

@freezed
sealed class UpdateDeviceFieldsInputEntity
    with _$UpdateDeviceFieldsInputEntity {
  const factory UpdateDeviceFieldsInputEntity({
    required bool? isOn,
    required bool? isOpen,
    required double? value,
  }) = _UpdateDeviceFieldsInputEntity;
}
