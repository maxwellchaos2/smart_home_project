import 'package:common/common.dart';
import 'package:devices/devices.dart';

part 'command_parser_result_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class CommandParserResultEntity with _$CommandParserResultEntity {
  const CommandParserResultEntity._();

  const factory CommandParserResultEntity.onOff({
    required DeviceEntity device,
    required bool isOn,
  }) = CommandParserResultOnOffEntity;

  const factory CommandParserResultEntity.open({
    required DeviceEntity device,
    required double openValue,
  }) = CommandParserResultOpenEntity;

  const factory CommandParserResultEntity.sayTemperature({
    required int temperature,
  }) = CommandParserResultSayTemperatureEntity;
}
