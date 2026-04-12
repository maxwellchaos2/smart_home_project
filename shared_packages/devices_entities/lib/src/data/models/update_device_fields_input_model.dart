import 'package:common/common.dart';

part 'update_device_fields_input_model.freezed.dart';
part 'update_device_fields_input_model.g.dart';

@Freezed(toJson: true)
sealed class UpdateDeviceFieldsInputModel with _$UpdateDeviceFieldsInputModel {
  const UpdateDeviceFieldsInputModel._();

  const factory UpdateDeviceFieldsInputModel({
    required bool? isOn,
    required bool? isOpen,
    required double? value,
  }) = _UpdateDeviceFieldsInputModel;

  @override
  Map<String, dynamic> toJson();
}
