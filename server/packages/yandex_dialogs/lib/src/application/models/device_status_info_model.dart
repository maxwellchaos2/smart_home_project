import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_status_info_model.freezed.dart';
part 'device_status_info_model.g.dart';

@Freezed(toJson: true)
sealed class DeviceStatusInfoModel with _$DeviceStatusInfoModel {
  const DeviceStatusInfoModel._();

  const factory DeviceStatusInfoModel({
    required bool reportable,
  }) = _DeviceStatusInfoModel;

  @override
  Map<String, Object?> toJson();
}
