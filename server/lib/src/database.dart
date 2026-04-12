import 'package:common/common.dart';
import 'package:database/database.dart';
import 'package:device_positions/device_positions.dart';
import 'package:device_scenario/device_scenario.dart';
import 'package:devices/devices.dart';
import 'package:email_verification/email_verification.dart';
import 'package:events/events.dart';
import 'package:floors/floors.dart';
import 'package:inout_scenario/inout_scenario.dart';
import 'package:oauth/oauth.dart';
import 'package:postgres/postgres.dart';
import 'package:projects/projects.dart';
import 'package:refresh_token/refresh_token.dart';
import 'package:rooms/rooms.dart';
import 'package:users/users.dart';
import 'package:yandex_auth/yandex_auth.dart';

class MyDatabaseService extends DatabaseService {
  const MyDatabaseService({
    required this.locator,
  });

  final GetIt locator;

  @override
  IDatabaseRepository get repo => locator.get<IDatabaseRepository>();

  @override
  int get schemaVersion => 21;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: () async {
          await locator.get<IProjectsRepository>().createTableIfNotExists();
          await locator.get<IFloorsRepository>().createTableIfNotExists();
          await locator.get<IRoomsRepository>().createTableIfNotExists();
          await locator.get<IUsersRepository>().createTableIfNotExists();
          await locator.get<IRefreshTokenRepository>().createTableIfNotExists();
          await locator.get<IDevicesRepository>().createTableIfNotExists();
          await locator.get<IEventsRepository>().createTableIfNotExists();
          await locator
              .get<IInOutScenarioRepository>()
              .createTableIfNotExists();
          await locator
              .get<IDeviceScenarioRepository>()
              .createTableIfNotExists();
          await locator.get<IAuthCodeRepository>().createTableIfNotExists();
          await locator.get<IYandexAuthRepository>().createTableIfNotExists();
          await locator
              .get<IDevicePositionsRepository>()
              .createTableIfNotExists();

          await locator
              .get<IEmailVerificationRepository>()
              .createTableIfNotExists();
        },
        onUpgrade: (txn, from, to) async {
          if (from < 2) {
            await txn.createTable(
              tableName: 'auth_code',
              columns: [
                'code VARCHAR(100) PRIMARY KEY',
                // 'clientId VARCHAR(100) NOT NULL',
                'user_id INT REFERENCES users(id) ON DELETE CASCADE',
                // 'expires_at TIMESTAMP NOT NULL',
              ],
            );
          }
          if (from < 3) {
            await txn.execute(
                'ALTER TABLE auth_code ADD COLUMN client_id VARCHAR(100) NOT NULL');
          }
          if (from < 4) {
            await txn.execute(
                'ALTER TABLE auth_code ADD COLUMN expires_at TIMESTAMP NOT NULL');
          }
          if (from < 5) {
            await txn.createTable(
              tableName: 'yandex_auth_token',
              columns: [
                'id SERIAL PRIMARY KEY',
                'access_token VARCHAR(255) NOT NULL',
                'refresh_token VARCHAR(255) NOT NULL',
                'expires_at TIMESTAMP NOT NULL',
                'user_id INT REFERENCES users(id) ON DELETE CASCADE',
              ],
            );
          }
          if (from < 6) {
            await txn.execute(
                'ALTER TABLE users ADD COLUMN has_yandex_auth BOOLEAN NOT NULL DEFAULT FALSE');
          }
          if (from < 7) {
            await txn.execute(
                'ALTER TABLE devices ADD COLUMN provider VARCHAR(50) NOT NULL DEFAULT \'unknown\'');
            await txn.execute(
                'ALTER TABLE devices ADD COLUMN provider_device_id VARCHAR(255)');
          }
          if (from < 8) {
            await txn.execute(
                'ALTER TABLE devices ALTER COLUMN position_angle DROP NOT NULL');
          }
          if (from < 9) {
            await txn.execute(
                'ALTER TABLE devices ADD COLUMN properties JSONB NOT NULL DEFAULT \'[]\'');
          }
          if (from < 10) {
            await txn.createTable(
              tableName: 'device_positions',
              columns: [
                'id SERIAL PRIMARY KEY',
                'x FLOAT NOT NULL',
                'y FLOAT NOT NULL',
                'angle FLOAT NOT NULL',
                'icon_media_path TEXT',
                'disabled_icon_media_path TEXT',
                'device_id INT REFERENCES devices(id) ON DELETE CASCADE',
              ],
            );
          }
          if (from < 11) {
            await txn
                .execute('ALTER TABLE rooms ADD COLUMN plan_media_path TEXT');
          }
          if (from < 12) {
            await txn.createTable(
              tableName: 'device_scenarios',
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
          if (from < 13) {
            // recreate yandex_auth_token table with project_id instead of user_id
            await txn.execute('DROP TABLE yandex_auth_token');
            await txn.createTable(
              tableName: 'yandex_auth_token',
              columns: [
                'id SERIAL PRIMARY KEY',
                'access_token VARCHAR(255) NOT NULL',
                'refresh_token VARCHAR(255) NOT NULL',
                'expires_at TIMESTAMP NOT NULL',
                'project_id INT REFERENCES projects(id) ON DELETE CASCADE',
              ],
            );
          }
          if (from < 14) {
            await txn
                .execute('UPDATE users SET has_yandex_auth = FALSE WHERE TRUE');
          }
          if (from < 15) {
            await txn.execute(
                'ALTER TABLE projects ADD COLUMN has_yandex_auth BOOLEAN NOT NULL DEFAULT FALSE');
            await txn.execute('ALTER TABLE users DROP COLUMN has_yandex_auth');
          }
          if (from < 16) {
            // clean table device_scenarios
            await txn.execute('DELETE FROM device_scenarios WHERE TRUE');
          }
          if (from < 17) {
            await txn.execute(
                'ALTER TABLE devices ADD COLUMN is_hidden BOOLEAN NOT NULL DEFAULT FALSE');
          }
          if (from < 18) {
            await txn
                .execute('ALTER TABLE users ADD COLUMN email VARCHAR(100)');
          }
          if (from < 19) {
            await txn.execute(
                'ALTER TABLE floors ALTER COLUMN plan_media_path DROP NOT NULL');
            await txn.createTable(
              tableName: 'email_verification_codes',
              columns: [
                'id SERIAL PRIMARY KEY',
                'email VARCHAR(255) NOT NULL',
                'code VARCHAR(6) NOT NULL',
                'created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
                'expires_at TIMESTAMP NOT NULL',
                'verified_at TIMESTAMP',
              ],
            );
            await txn.execute(
                'ALTER TABLE projects ADD COLUMN user_id INT REFERENCES users(id) ON DELETE CASCADE');
            await txn.execute(
              'DELETE FROM users WHERE type = \'arduino\'',
            );
            await txn.execute(
                '''UPDATE projects p SET user_id = u.id FROM users u WHERE u.project_id = p.id AND p.user_id IS NULL''');
            await txn.execute(
                'ALTER TABLE projects ALTER COLUMN user_id SET NOT NULL');
            await txn.execute(
                'ALTER TABLE users DROP CONSTRAINT IF EXISTS users_project_id_fkey');
            await txn
                .execute('ALTER TABLE users DROP COLUMN IF EXISTS project_id');
          }
          if (from < 20) {
            await txn
                .execute('ALTER TABLE devices ADD COLUMN custom_data JSONB');
          }
          if (from < 21) {
            await txn.execute(
                'ALTER TABLE devices ADD COLUMN last_heartbeat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP');
            await txn.execute(
                'ALTER TABLE devices ADD COLUMN status VARCHAR(50) NOT NULL DEFAULT \'offline\'');
          }
        },
      );

  Future<void> _initModule() async {
    // Initialize the database module.
    late final Connection connection;
    int retries = 0;

    final dbHost = ENV.fromKey('DB_HOST');
    final dbPassword = ENV.fromKey('POSTGRES_PASSWORD');
    while (retries < 5) {
      try {
        connection = await Connection.open(
          Endpoint(
            host: dbHost,
            port: 5432,
            database: 'smart_home',
            username: 'postgres',
            password: dbPassword,
          ),
          settings: ConnectionSettings(
            sslMode: SslMode.disable,
          ),
        );
        break;
      } catch (e) {
        print(e);
        retries++;
        await Future.delayed(Duration(seconds: 1 * retries));
      }
    }

    await DatabaseModule.init(
      locator: locator,
      connection: connection,
    );
  }

  @override
  Future<void> init() async {
    await _initModule();
    await super.init();
  }
}
