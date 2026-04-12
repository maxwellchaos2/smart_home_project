import 'package:database/src/data/data.dart';

abstract interface class IDatabaseDatasource {
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

  Future<List<Map<String, dynamic>>> execute(String query,
      {Map<String, dynamic>? parameters});

  Future<void> transaction(
      Future<void> Function(IDatabaseDatasource txn) action);
}

final class DatabaseDatasourceImpl implements IDatabaseDatasource {
  const DatabaseDatasourceImpl({required IPostgresClient client})
      : _client = client;

  final IPostgresClient _client;

  @override
  Future<bool> tableExists({required String tableName}) async {
    return await _client.tableExists(tableName: tableName);
  }

  @override
  Future<bool> createTable(
      {required String tableName, required List<String> columns}) async {
    return await _client.createTable(tableName: tableName, columns: columns);
  }

  @override
  Future<List<Map<String, dynamic>>> selectAll(
      {required String tableName}) async {
    return await _client.selectAll(tableName: tableName);
  }

  @override
  Future<Map<String, dynamic>?> selectOneByColumn(
      {required String tableName,
      required String column,
      required dynamic value}) async {
    return await _client.selectOneByColumn(
        tableName: tableName, column: column, value: value);
  }

  @override
  Future<List<Map<String, dynamic>>> selectByColumn(
      {required String tableName,
      required String column,
      required dynamic value}) async {
    return await _client.selectByColumn(
      tableName: tableName,
      column: column,
      value: value,
    );
  }

  @override
  Future<Map<String, dynamic>> insert(
      {required String tableName, required Map<String, dynamic> input}) async {
    return await _client.insert(tableName: tableName, input: input);
  }

  @override
  Future<int> getSchemeVersion() async {
    return await _client.getSchemeVersion();
  }

  @override
  Future<void> setSchemeVersion({required int version}) async {
    return await _client.setSchemeVersion(version: version);
  }

  @override
  Future<List<Map<String, dynamic>>> execute(String query,
      {Map<String, dynamic>? parameters}) async {
    final result = await _client.execute(query, parameters: parameters);
    return result.map((row) => row.toColumnMap()).toList();
  }

  @override
  Future<void> transaction(
      Future<void> Function(IDatabaseDatasource txn) action) async {
    return await _client.transaction(
      (IPostgresClient txn) => action(DatabaseDatasourceImpl(client: txn)),
    );
  }
}
