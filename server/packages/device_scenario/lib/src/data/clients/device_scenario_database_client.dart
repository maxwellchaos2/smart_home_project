import 'dart:convert';

import 'package:database/database.dart';
import 'package:device_scenario/src/data/data.dart';

abstract interface class IDeviceScenarioDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<DeviceScenarioModel>> fetchAll({int? projectId});

  Future<DeviceScenarioModel?> fetchById({required int id});

  Future<DeviceScenarioModel> createScenario(
      {required DeviceScenarioInputModel input});

  Future<DeviceScenarioModel> updateScenario(
      {required int id, required DeviceScenarioInputModel input});

  Future<void> deleteScenario({required int id});
}

final class DeviceScenarioDatabaseClientImpl
    implements IDeviceScenarioDatabaseClient {
  const DeviceScenarioDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'device_scenarios';

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
  Future<List<DeviceScenarioModel>> fetchAll({int? projectId}) async {
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
        .map((scenario) => DeviceScenarioModel.fromJson(scenario))
        .toList();
  }

  @override
  Future<DeviceScenarioModel?> fetchById({required int id}) async {
    final scenarios = await _database.repo.execute(
      '''
    SELECT *
    FROM $tableName
    WHERE id = @id
  ''',
      parameters: {
        'id': id,
      },
    );

    if (scenarios.isEmpty) {
      return null;
    }

    return DeviceScenarioModel.fromJson(scenarios.first);
  }

  @override
  Future<DeviceScenarioModel> createScenario(
      {required DeviceScenarioInputModel input}) async {
    final inputMap = input.toJson();
    inputMap['condition'] = jsonEncode(inputMap['condition']);
    inputMap['actions'] = jsonEncode(inputMap['actions']);
    final scenario =
        await _database.repo.insert(tableName: tableName, input: inputMap);
    return DeviceScenarioModel.fromJson(scenario);
  }

  @override
  Future<DeviceScenarioModel> updateScenario(
      {required int id, required DeviceScenarioInputModel input}) async {
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

    return DeviceScenarioModel.fromJson(result.first);
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
}
