import 'package:common/common.dart';
import 'package:localization/src/data/data.dart';
import 'package:localization/src/domain/domain.dart';

abstract final class LocalizationDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(getRepo);
  }

  static ILocalizationRepository getRepo() {
    return LocalizationRepositoryImpl(
      platformSource: LocalizationPlatformDatasourceImpl(
        client: LocalizationPlatformClientImpl(),
      ),
      localSource: LocalizationLocalDatasourceImpl(
        client: LocalizationStorageClientImpl(),
      ),
    );
  }
}
