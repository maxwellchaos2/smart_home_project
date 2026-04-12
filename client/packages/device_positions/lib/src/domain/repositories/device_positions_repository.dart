import 'package:device_positions/src/domain/domain.dart';

abstract interface class IDevicePositionsRepository {
  Future<List<DevicePositionEntity>> fetchAll();
}
