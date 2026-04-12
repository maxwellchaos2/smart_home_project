import 'package:common/common.dart';
import 'package:devices_entities/src/domain/domain.dart';

part 'device_capability_entity.freezed.dart';
part 'device_capability_entity.g.dart';

@Freezed(
  fromJson: true,
  toJson: true,
  copyWith: true,
  equal: true,
  unionKey: 'type',
  fallbackUnion: 'unknown',
)
sealed class DeviceCapabilityEntity with _$DeviceCapabilityEntity {
  const DeviceCapabilityEntity._();

  const factory DeviceCapabilityEntity.onOff({
    bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = DeviceCapabilityOnOffEntity;

  const factory DeviceCapabilityEntity.colorSetting({
    bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = DeviceCapabilityColorSettingEntity;

  const factory DeviceCapabilityEntity.range({
    bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = DeviceCapabilityRangeEntity;

  const factory DeviceCapabilityEntity.mode({
    bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = _DeviceCapabilityModeEntity;

  const factory DeviceCapabilityEntity.float({
    bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = _DeviceCapabilityFloatEntity;

  const factory DeviceCapabilityEntity.unknown({
    bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = _DeviceCapabilityUnknownEntity;

  factory DeviceCapabilityEntity.fromJson(Map<String, Object?> json) =>
      _$DeviceCapabilityEntityFromJson(json);

  @override
  Map<String, Object?> toJson();
}
