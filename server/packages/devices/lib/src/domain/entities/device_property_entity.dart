import 'package:common/common.dart';
import 'package:devices/src/domain/domain.dart';

part 'device_property_entity.freezed.dart';
part 'device_property_entity.g.dart';

@Freezed(
    fromJson: true, toJson: true, copyWith: true, equal: true, unionKey: 'type')
sealed class DevicePropertyEntity with _$DevicePropertyEntity {
  const DevicePropertyEntity._();

  const factory DevicePropertyEntity.float({
    required DeviceCapabilityStateEntity? state,
    required DeviceCapabilityParametersEntity? parameters,
  }) = _DevicePropertyFloatEntity;

  const factory DevicePropertyEntity.event({
    required Map<String, dynamic>? state,
    required Map<String, dynamic>? parameters,
  }) = _DevicePropertyEventEntity;

  factory DevicePropertyEntity.fromJson(Map<String, Object?> json) =>
      _$DevicePropertyEntityFromJson(json);

  Map<String, Object?> toJson();
}
