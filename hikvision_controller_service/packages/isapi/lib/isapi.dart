library;

import 'package:common/common.dart';

import 'src/di/di.dart';

export 'package:xml/xml.dart';

export 'src/data/data.dart' show IISAPIClient;

abstract final class ISAPIModule {
  static Future<void> init({
    required GetIt locator,
    required String host,
    required String username,
    required String password,
  }) async {
    await ISAPIDI.init(
        locator: locator, host: host, username: username, password: password);
  }
}
