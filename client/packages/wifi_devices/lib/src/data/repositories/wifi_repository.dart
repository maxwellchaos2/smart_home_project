import 'package:wifi_devices/src/data/data.dart';
import 'package:wifi_devices/src/domain/domain.dart';

final class WifiRepositoryImpl implements IWifiRepository {
  const WifiRepositoryImpl({
    required IWifiPlatformDatasource platformSource,
  }) : _platformSource = platformSource;

  final IWifiPlatformDatasource _platformSource;

  @override
  Future<String?> fetchName() async {
    return _platformSource.fetchName();
  }
}
