library;

import 'package:common/common.dart';
import 'package:database/src/di/di.dart';
import 'package:postgres/postgres.dart';

export 'src/domain/domain.dart'
    show DatabaseService, MigrationStrategy, IDatabaseRepository;

abstract final class DatabaseModule {
  static Future<void> init(
      {required GetIt locator, required Connection connection}) async {
    await DatabseDI.init(
      locator: locator,
      connection: connection,
    );
  }
}
