import 'package:database/src/domain/domain.dart';

abstract class DatabaseService {
  const DatabaseService();

  int get schemaVersion;

  MigrationStrategy get migration;

  IDatabaseRepository get repo;

  Future<void> init() async {
    if (!await repo.tableExists(tableName: 'schema_version')) {
      await repo.createTable(
        tableName: 'schema_version',
        columns: [
          'version INTEGER NOT NULL',
        ],
      );
      await repo.insert(
        tableName: 'schema_version',
        input: {
          'version': schemaVersion,
        },
      );
      await migration.onCreate();
    } else {
      final version = await repo.getSchemeVersion();
      if (version != schemaVersion) {
        await repo.transaction((txn) async {
          await migration.onUpgrade(txn, version, schemaVersion);
          await txn.setSchemeVersion(version: schemaVersion);
        });
      }
    }
  }
}

class MigrationStrategy {
  const MigrationStrategy({
    required this.onCreate,
    required this.onUpgrade,
  });

  final Future<void> Function() onCreate;
  final Future<void> Function(IDatabaseRepository txn, int from, int to)
      onUpgrade;
}
