import 'package:postgres/postgres.dart';

abstract interface class IPostgresClient {
  Future<bool> tableExists({required String tableName});

  Future<bool> createTable({
    required String tableName,
    required List<String> columns,
  });

  Future<List<Map<String, dynamic>>> selectAll({required String tableName});

  Future<Map<String, dynamic>?> selectOneByColumn({
    required String tableName,
    required String column,
    required dynamic value,
  });

  Future<List<Map<String, dynamic>>> selectByColumn({
    required String tableName,
    required String column,
    required dynamic value,
  });

  Future<Map<String, dynamic>> insert({
    required String tableName,
    required Map<String, dynamic> input,
  });

  Future<int> getSchemeVersion();

  Future<void> setSchemeVersion({required int version});

  Future<Result> execute(String query, {Map<String, dynamic>? parameters});

  Future<void> transaction(Future<void> Function(IPostgresClient txn) action);
}

final class PostgresClientImpl implements IPostgresClient {
  const PostgresClientImpl({required Session connection})
      : _connection = connection;

  final Session _connection;

  @override
  Future<bool> tableExists({required String tableName}) async {
    final results = await _connection.execute(
      'SELECT EXISTS ('
      'SELECT FROM information_schema.tables '
      "WHERE table_name = '$tableName'"
      ')',
    );
    return results.first.first as bool;
  }

  @override
  Future<bool> createTable(
      {required String tableName, required List<String> columns}) async {
    final columnsString = columns.join(', ');
    await _connection.execute('CREATE TABLE $tableName ($columnsString)');
    return true;
  }

  @override
  Future<List<Map<String, dynamic>>> selectAll(
      {required String tableName}) async {
    final results = await _connection.execute('SELECT * FROM $tableName');
    return results.map((row) => row.toColumnMap()).toList();
  }

  @override
  Future<Map<String, dynamic>?> selectOneByColumn({
    required String tableName,
    required String column,
    required dynamic value,
  }) async {
    final query = Sql.named(
      'SELECT * FROM $tableName WHERE $column = @value LIMIT 1',
    );
    final results = await _connection.execute(
      query,
      parameters: {
        'value': value,
      },
    );
    if (results.isEmpty) {
      return null;
    }
    return results.first.toColumnMap();
  }

  @override
  Future<List<Map<String, dynamic>>> selectByColumn({
    required String tableName,
    required String column,
    required dynamic value,
  }) async {
    final query = Sql.named(
      'SELECT * FROM $tableName WHERE $column = @value',
    );
    final results = await _connection.execute(
      query,
      parameters: {
        'value': value,
      },
    );
    return results.map((row) => row.toColumnMap()).toList();
  }

  @override
  Future<Map<String, dynamic>> insert({
    required String tableName,
    required Map<String, dynamic> input,
  }) async {
    final columns = input.keys.join(', ');
    final valuesNames = input.entries
        .map((entry) =>
            '@${entry.key}${entry.value is Map || entry.value is List ? '::jsonb' : ''}')
        .join(', ');
    final query = Sql.named(
      'INSERT INTO $tableName ($columns) VALUES ($valuesNames) RETURNING *',
    );

    final params = <String, dynamic>{};
    input.forEach((key, value) {
      params[key] = value;
    });

    final result = await _connection.execute(query, parameters: params);
    return result.first.toColumnMap();
  }

  @override
  Future<int> getSchemeVersion() async {
    final result =
        await _connection.execute('SELECT version FROM schema_version LIMIT 1');
    if (result.isNotEmpty) {
      return result.first[0] as int;
    } else {
      return 0; // Если таблица schema_version пуста, возвращаем 0
    }
  }

  @override
  Future<void> setSchemeVersion({required int version}) async {
    await _connection.execute('UPDATE schema_version SET version = $version');
  }

  @override
  Future<Result> execute(String query,
      {Map<String, dynamic>? parameters}) async {
    if (parameters == null) {
      return await _connection.execute(query);
    }
    return await _connection.execute(Sql.named(query), parameters: parameters);
  }

  @override
  Future<void> transaction(
      Future<void> Function(IPostgresClient txn) action) async {
    await (_connection as Connection).runTx((txn) async {
      final client = PostgresClientImpl(connection: txn);
      await action(client);
    });
  }
}
