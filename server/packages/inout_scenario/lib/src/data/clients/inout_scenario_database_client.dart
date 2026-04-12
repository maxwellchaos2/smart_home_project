import 'dart:convert';

import 'package:database/database.dart';
import 'package:inout_scenario/src/data/data.dart';

abstract interface class IInOutScenarioDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<InOutScenarioModel>> fetchAll({int? projectId});

  Future<InOutScenarioModel> createScenario(
      {required InOutScenarioInputModel input});

  Future<InOutScenarioModel> updateScenario(
      {required int id, required InOutScenarioInputModel input});

  Future<void> deleteScenario({required int id});

  Future<InOutScenarioModel> fetch({required int id});
}

final class InOutScenarioDatabaseClientImpl
    implements IInOutScenarioDatabaseClient {
  const InOutScenarioDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'inout_scenarios';

  @override
  Future<bool> tableExists() async {
    return await _database.repo.tableExists(tableName: tableName);
  }

  @override
  Future<bool> createTable() async {
    return await _database.repo.createTable(
      tableName: tableName,
      columns: [
        'id SERIAL PRIMARY KEY',
        'name VARCHAR(100) NOT NULL',
        'project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE',
        'condition JSONB NOT NULL',
        'actions JSONB NOT NULL',
        'timer INT',
        'created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
      ],
    );
  }

  @override
  Future<List<InOutScenarioModel>> fetchAll({int? projectId}) async {
    final scenarios = switch (projectId) {
      int projectId => await _database.repo.execute(
          '''
        SELECT *
        FROM $tableName
        WHERE project_id = @projectId
        ORDER BY created_at ASC
      ''',
          parameters: {
            'projectId': projectId,
          },
        ),
      null => await _database.repo.selectAll(tableName: tableName),
    };
    ;

    return scenarios
        .map((scenario) => InOutScenarioModel.fromJson(scenario))
        .toList();
  }

  @override
  Future<InOutScenarioModel> createScenario(
      {required InOutScenarioInputModel input}) async {
    final inputMap = input.toJson();
    inputMap['condition'] = jsonEncode(inputMap['condition']);
    inputMap['actions'] = jsonEncode(inputMap['actions']);
    final scenario =
        await _database.repo.insert(tableName: tableName, input: inputMap);
    return InOutScenarioModel.fromJson(scenario);
  }

  @override
  Future<InOutScenarioModel> updateScenario(
      {required int id, required InOutScenarioInputModel input}) async {
    final inputMap = input.toJson();
    inputMap['condition'] = jsonEncode(inputMap['condition']);
    inputMap['actions'] = jsonEncode(inputMap['actions']);

    final updateFields = <String>[];

    for (final field in inputMap.keys) {
      updateFields.add('$field = @$field');
    }

    final updateQuery = '''
    UPDATE $tableName
    SET  ${updateFields.join(', ')}
    WHERE id = @id
    RETURNING *
  ''';

    final result = await _database.repo.execute(
      updateQuery,
      parameters: {
        ...inputMap,
        'condition': jsonEncode(inputMap['condition']),
        'actions': jsonEncode(inputMap['actions']),
        'id': id,
      },
    );

    return InOutScenarioModel.fromJson(result.first);
  }

  @override
  Future<void> deleteScenario({required int id}) async {
    await _database.repo.execute(
      '''
    DELETE FROM $tableName
    WHERE id = @id
  ''',
      parameters: {
        'id': id,
      },
    );
  }

  @override
  Future<InOutScenarioModel> fetch({required int id}) async {
    final result = await _database.repo.execute(
      '''
    SELECT *
    FROM $tableName
    WHERE id = @id
    LIMIT 1
  ''',
      parameters: {
        'id': id,
      },
    );
    if (result.isEmpty) {
      throw Exception('Scenario with id $id not found');
    }
    return InOutScenarioModel.fromJson(result.first);
  }
}
