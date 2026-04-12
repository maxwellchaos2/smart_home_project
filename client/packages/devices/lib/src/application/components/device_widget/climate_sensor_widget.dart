import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';

final class ClimateSensorWidget extends BaseDeviceWidget {
  const ClimateSensorWidget({
    super.key,
    super.iconSize,
    required super.device,
  });

  DeviceCapabilityStateTemperatureEntity? getTemperature() {
    return device.properties.byTypeOrNull();
  }

  DeviceCapabilityParametersTemperatureEntity? getTemperatureParameters() {
    return device.properties.parametersByTypeOrNull();
  }

  DeviceCapabilityStateHumidityEntity? getHumidity() {
    return device.properties.byTypeOrNull();
  }

  DeviceCapabilityParametersHumidityEntity? getHumidityParameters() {
    return device.properties.parametersByTypeOrNull();
  }

  @override
  Widget buildCapabilitiesAndProperties(BuildContext context) {
    final temperature = getTemperature();
    final humidity = getHumidity();
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (temperature != null && humidity != null) ...[
            Row(
              children: [
                Text(
                  '${temperature.value.toInt()}${unitToString(
                    getTemperatureParameters()!.unit,
                  )}',
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.w600)
                      .reverseMerge(context.textTheme.bodyLarge),
                ),
                const SizedBox(width: 8),
                Text(
                  '${humidity.value.toInt()}${unitToString(
                    getHumidityParameters()!.unit,
                  )}',
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.w600)
                      .reverseMerge(context.textTheme.bodyLarge),
                ),
              ],
            ),
          ] else ...[
            if (temperature != null)
              Text(
                '${temperature.value.toInt()}${unitToString(
                  getTemperatureParameters()!.unit,
                )}',
                maxLines: 1,
                style: context.textTheme.headlineMedium,
              ),
            if (humidity != null)
              Text(
                '${humidity.value.toInt()}${unitToString(
                  getHumidityParameters()!.unit,
                )}',
                maxLines: 1,
                style: context.textTheme.headlineMedium,
              ),
          ]
        ],
      ),
    );
  }
}
