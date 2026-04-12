import 'package:common/common.dart';
import 'package:devices/devices.dart';

part 'condition_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class ConditionEntity with _$ConditionEntity {
  const ConditionEntity._();

  const factory ConditionEntity.logic({
    required ConditionLogicType logic,
    required List<ConditionEntity> conditions,
  }) = ConditionLogicEntity;

  const factory ConditionEntity.deviceState({
    required int deviceId,
    required DeviceCapabilityStateEntity state,
  }) = ConditionDeviceStateEntity;

  const factory ConditionEntity.deviceStateValue({
    required int deviceId,
    required DeviceCapabilityStateEntity state,
    required ConditionOperator operator,
  }) = ConditionDeviceStateValueEntity;

  const factory ConditionEntity.deviceEvent({
    required int deviceId,
    required DeviceEvent event,
  }) = ConditionDeviceEventEntity;

  const factory ConditionEntity.inputState({
    required int inputId,
    required ConditionInputStateType state,
  }) = ConditionInputStateEntity;
}

enum ConditionLogicType {
  and,
  or,
}

enum ConditionOperator {
  equal,
  notEqual,
  greaterThan,
  lessThan,
}

enum ConditionInputStateType {
  on,
  off,
  change,
}

typedef DeviceEvent = ({String key, String? value});
