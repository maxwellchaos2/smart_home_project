import 'package:database/src/data/datasource/database_datasource.dart';
import 'package:database/src/domain/domain.dart';

final class DatabaseRepositoryImpl implements IDatabaseRepository {
  const DatabaseRepositoryImpl({
    required IDatabaseDatasource source,
  }) : _source = source;

  final IDatabaseDatasource _source;

  @override
  Future<bool> tableExists({required String tableName}) async {
    return await _source.tableExists(tableName: tableName);
  }

  @override
  Future<bool> createTable(
      {required String tableName, required List<String> columns}) async {
    return await _source.createTable(tableName: tableName, columns: columns);
  }

  @override
  Future<List<Map<String, dynamic>>> selectAll(
      {required String tableName}) async {
    return await _source.selectAll(tableName: tableName);
  }

  @override
  Future<Map<String, dynamic>?> selectOneByColumn(
      {required String tableName,
      required String column,
      required dynamic value}) async {
    return await _source.selectOneByColumn(
        tableName: tableName, column: column, value: value);
  }

  @override
  Future<List<Map<String, dynamic>>> selectByColumn(
      {required String tableName,
      required String column,
      required dynamic value}) async {
    return await _source.selectByColumn(
        tableName: tableName, column: column, value: value);
  }

  @override
  Future<Map<String, dynamic>> insert(
      {required String tableName, required Map<String, dynamic> input}) async {
    return await _source.insert(tableName: tableName, input: input);
  }

  @override
  Future<int> getSchemeVersion() async {
    return await _source.getSchemeVersion();
  }

  @override
  Future<void> setSchemeVersion({required int version}) async {
    return await _source.setSchemeVersion(version: version);
  }

  @override
  Future<List<Map<String, dynamic>>> execute(String query,
      {Map<String, dynamic>? parameters}) async {
    return await _source.execute(query, parameters: parameters);
  }

  @override
  Future<void> transaction(
      Future<void> Function(IDatabaseRepository txn) action) async {
    return await _source.transaction(
      (IDatabaseDatasource txn) async {
        final repository = DatabaseRepositoryImpl(source: txn);
        await action(repository);
      },
    );
  }
}
