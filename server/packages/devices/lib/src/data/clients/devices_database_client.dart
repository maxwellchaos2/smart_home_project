import 'dart:convert';

import 'package:database/database.dart';
import 'package:devices/src/data/data.dart';

abstract interface class IDevicesDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<DeviceModel>> fetchAll({int? projectId, List<int>? ids});

  Future<DeviceModel> fetch({required int id});

  Future<DeviceModel> fetchByProvider({
    required String providerType,
    required String providerDeviceId,
  });

  Future<DeviceModel> createDevice({required DeviceInputModel input});

  Future<DeviceModel> updateDevice(
      {required int deviceId, required DeviceInputModel input});

  Future<void> deleteDevice({required int id});

  Future<DeviceModel> updateDeviceState({
    required int deviceId,
    List<Map<String, Object?>>? capabilities,
    List<Map<String, Object?>>? properties,
  });

  Future<DeviceModel?> fetchByInputId({
    required int inputId,
    required int projectId,
  });
  Future<DeviceModel?> fetchByOutputId({
    required int outputId,
    required int projectId,
  });

  Future<void> deleteAllByProviderType({required String providerType});

  Future<DeviceModel> onDeviceHeartbeat({
    required int deviceId,
  });

  /// Обновляет статус устройств на offline если last_heartbeat > 30 секунд
  /// Возвращает список ID устройств, которые стали offline
  Future<List<DeviceModel>> updateOfflineDevices();
}

final class DevicesDatabaseClientImpl implements IDevicesDatabaseClient {
  const DevicesDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'devices';

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
        'type VARCHAR(50) NOT NULL',
        'provider VARCHAR(50) NOT NULL DEFAULT \'unknown\'',
        'provider_device_id VARCHAR(255)',
        'input_id INTEGER',
        'output_id INTEGER',
        'name VARCHAR(100) NOT NULL',
        'is_hidden BOOLEAN NOT NULL DEFAULT FALSE',
        'capabilities JSONB NOT NULL',
        'properties JSONB NOT NULL',
        'created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'room_id INTEGER REFERENCES rooms(id) ',
        'floor_id INTEGER REFERENCES floors(id)',
        'project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE',
        'custom_data JSONB',
        'last_heartbeat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'status VARCHAR(50) NOT NULL DEFAULT \'offline\'',
      ],
    );
  }

  @override
  Future<List<DeviceModel>> fetchAll({int? projectId, List<int>? ids}) async {
    String query;
    final parameters = <String, dynamic>{};

    if (projectId != null && ids != null && ids.isNotEmpty) {
      query = '''
        SELECT *
        FROM $tableName 
        WHERE project_id = @projectId
          AND id = ANY(@ids)
        ORDER BY created_at ASC
      ''';
      parameters['projectId'] = projectId;
      parameters['ids'] = ids;
    } else if (projectId != null) {
      query = '''
        SELECT *
        FROM $tableName 
        WHERE project_id = @projectId
        ORDER BY created_at ASC
      ''';
      parameters['projectId'] = projectId;
    } else if (ids != null && ids.isNotEmpty) {
      query = '''
        SELECT *
        FROM $tableName 
        WHERE id = ANY(@ids)
        ORDER BY created_at ASC
      ''';
      parameters['ids'] = ids;
    } else {
      query = '''
        SELECT *
        FROM $tableName 
        ORDER BY created_at ASC
      ''';
    }

    final devices = await _database.repo.execute(
      query,
      parameters: parameters,
    );
    return devices.map((device) => DeviceModel.fromJson(device)).toList();
  }

  @override
  Future<DeviceModel> fetch({required int id}) async {
    final device = await _database.repo.execute(
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
    return DeviceModel.fromJson(device.first);
  }

  @override
  Future<DeviceModel> fetchByProvider({
    required String providerType,
    required String providerDeviceId,
  }) async {
    final device = await _database.repo.execute(
      '''
    SELECT *
    FROM $tableName
    WHERE provider = @providerType AND provider_device_id = @providerDeviceId
    LIMIT 1
      ''',
      parameters: {
        'providerType': providerType,
        'providerDeviceId': providerDeviceId,
      },
    );
    return DeviceModel.fromJson(device.first);
  }

  @override
  Future<DeviceModel> createDevice({required DeviceInputModel input}) async {
    final inputMap = input.toJson();
    final newDevice =
        await _database.repo.insert(tableName: tableName, input: inputMap);

    return DeviceModel.fromJson(newDevice);
  }

  @override
  Future<DeviceModel> updateDevice(
      {required int deviceId, required DeviceInputModel input}) async {
    final inputMap = input.toJson();
    final updateFields = <String>[];

    if (inputMap.containsKey('input_id')) {
      updateFields.add('input_id = @input_id');
    }
    if (inputMap.containsKey('output_id')) {
      updateFields.add('output_id = @output_id');
    }

    if (inputMap.containsKey('capabilities')) {
      updateFields.add('capabilities = @capabilities');
    }

    if (inputMap.containsKey('properties')) {
      updateFields.add('properties = @properties');
    }

    if (inputMap.containsKey('custom_data')) {
      updateFields.add('custom_data = @custom_data');
    }

    final updateQuery = '''
    UPDATE $tableName
    SET type = @type,
        name = @name,
        room_id = @room_id,
        floor_id = @floor_id,
        project_id = @project_id,
        updated_at = CURRENT_TIMESTAMP,
        provider = @provider,
        is_hidden = @is_hidden,
        provider_device_id = @provider_device_id,
        ${updateFields.join(', ')}
    WHERE id = @device_id
    RETURNING *
  ''';

    final result = await _database.repo.execute(
      updateQuery,
      parameters: {
        ...inputMap,
        'device_id': deviceId,
      },
    );

    return DeviceModel.fromJson(result.first);
  }

  @override
  Future<void> deleteDevice({required int id}) async {
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
  Future<DeviceModel> updateDeviceState({
    required int deviceId,
    List<Map<String, Object?>>? capabilities,
    List<Map<String, Object?>>? properties,
  }) async {
    final device = await fetch(id: deviceId);

    final updateParts = <String>[];

    if (capabilities != null) {
      updateParts.add('capabilities = @capabilities::jsonb');

      capabilities = device.capabilities.map((c) {
        final capability = c as Map<String, Object?>;
        for (final uCapability in capabilities!) {
          if (uCapability['type'] == capability['type'] &&
              (uCapability['state'] as Map?)?['instance'] ==
                  (capability['state'] as Map?)?['instance']) {
            return {
              ...capability,
              'state': {
                ...(capability['state'] as Map? ?? {}),
                ...(uCapability['state'] as Map? ?? {}),
              },
            };
          }
        }
        return capability;
      }).toList();
    }

    if (properties != null) {
      updateParts.add('properties = @properties::jsonb');

      properties = device.properties.map((p) {
        final property = p as Map<String, Object?>;
        for (final uProperty in properties!) {
          if (uProperty['type'] == property['type'] &&
              (uProperty['state'] as Map?)?['instance'] ==
                  (property['state'] as Map?)?['instance'] &&
              (uProperty['parameters'] as Map?)?['instance'] ==
                  (property['parameters'] as Map?)?['instance']) {
            return uProperty;
          }
        }
        return property;
      }).toList();
    }

    if (updateParts.isEmpty) {
      // Если нет данных для обновления, просто возвращаем существующее устройство
      return device;
    }

    final updateQuery = '''
    UPDATE $tableName
    SET ${updateParts.join(', ')},
        updated_at = CURRENT_TIMESTAMP
    WHERE id = @device_id
    RETURNING *
  ''';

    final result = await _database.repo.execute(
      updateQuery,
      parameters: {
        if (capabilities != null) 'capabilities': jsonEncode(capabilities),
        if (properties != null) 'properties': jsonEncode(properties),
        'device_id': deviceId,
      },
    );

    return DeviceModel.fromJson(result.first);
  }

  @override
  Future<DeviceModel?> fetchByInputId({
    required int inputId,
    required int projectId,
  }) async {
    final device = await _database.repo.execute(
      '''
    SELECT *
    FROM $tableName
    WHERE input_id = @input_id AND project_id = @project_id
    LIMIT 1
  ''',
      parameters: {
        'input_id': inputId,
        'project_id': projectId,
      },
    );
    return switch (device.isEmpty) {
      true => null,
      false => DeviceModel.fromJson(device.first),
    };
  }

  @override
  Future<DeviceModel?> fetchByOutputId({
    required int outputId,
    required int projectId,
  }) async {
    final device = await _database.repo.execute(
      '''
    SELECT *
    FROM $tableName
    WHERE output_id = @output_id AND project_id = @project_id
    LIMIT 1
  ''',
      parameters: {
        'output_id': outputId,
        'project_id': projectId,
      },
    );
    return switch (device.isEmpty) {
      true => null,
      false => DeviceModel.fromJson(device.first),
    };
  }

  @override
  Future<void> deleteAllByProviderType({
    required String providerType,
  }) async {
    await _database.repo.execute(
      '''
    DELETE FROM $tableName
    WHERE provider = @providerType
  ''',
      parameters: {
        'providerType': providerType,
      },
    );
  }

  @override
  Future<DeviceModel> onDeviceHeartbeat({
    required int deviceId,
  }) async {
    final result = await _database.repo.execute(
      '''
    UPDATE $tableName
    SET last_heartbeat = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP,
        status = 'online'
    WHERE id = @device_id
    RETURNING *
  ''',
      parameters: {
        'device_id': deviceId,
      },
    );

    return DeviceModel.fromJson(result.first);
  }

  @override
  Future<List<DeviceModel>> updateOfflineDevices() async {
    final result = await _database.repo.execute(
      '''
    UPDATE $tableName
    SET status = 'offline',
        updated_at = CURRENT_TIMESTAMP
    WHERE status = 'online'
      AND last_heartbeat < NOW() - INTERVAL '30 seconds'
    RETURNING *''',
    );

    return result.map((row) => DeviceModel.fromJson(row)).toList();
  }
}
