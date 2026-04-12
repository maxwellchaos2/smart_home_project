import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class SignInDeviceInputMapper {
  static SignInDeviceInputModel toModel({required SignInDeviceInputEntity from}) {
    return SignInDeviceInputModel(
      deviceId: from.deviceId,
    );
  }
}
