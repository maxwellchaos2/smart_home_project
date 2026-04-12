abstract interface class IDatabaseRepository {
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
      Future<void> Function(IDatabaseRepository txn) action);
}
