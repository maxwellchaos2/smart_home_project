import 'package:common/common.dart';
import 'package:devices/src/domain/domain.dart';

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
    required bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = _DeviceCapabilityOnOffEntity;

  const factory DeviceCapabilityEntity.colorSetting({
    required bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = _DeviceCapabilityColorSettingEntity;

  const factory DeviceCapabilityEntity.range({
    required bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = _DeviceCapabilityRangeEntity;

  const factory DeviceCapabilityEntity.mode({
    required bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = _DeviceCapabilityModeEntity;

  const factory DeviceCapabilityEntity.float({
    required bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = _DeviceCapabilityFloatEntity;

  const factory DeviceCapabilityEntity.unknown({
    required bool? reportable,
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = _DeviceCapabilityUnknownEntity;

  factory DeviceCapabilityEntity.fromJson(Map<String, Object?> json) =>
      _$DeviceCapabilityEntityFromJson(json);

  @override
  Map<String, Object?> toJson();
}

extension ListDeviceCapabilityEntityEx on List<DeviceCapabilityEntity> {
  T byType<T>() => (firstWhere(
        (element) => element.state is T,
      ).state as T);

  T? byTypeOrNull<T>() {
    try {
      return byType<T>();
    } catch (_) {
      return null as T?;
    }
  }

  T parametersByType<T>() => (firstWhere(
        (element) => element.parameters is T,
      ).parameters as T);
}

extension ListDevicePropertyEntityEx on List<DevicePropertyEntity> {
  T byType<T>() => (firstWhere(
        (element) => element.state is T,
      ).state as T);

  T? byTypeOrNull<T>() {
    try {
      return byType<T>();
    } catch (_) {
      return null as T?;
    }
  }

  T parametersByType<T>() => (firstWhere(
        (element) => element.parameters is T,
      ).parameters as T);

  T? parametersByTypeOrNull<T>() {
    try {
      return parametersByType<T>();
    } catch (_) {
      return null as T?;
    }
  }
}
