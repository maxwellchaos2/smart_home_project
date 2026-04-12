import 'package:localization/src/domain/domain.dart';

import '../data.dart';

abstract class ILocalizationPlatformDatasource {
  Future<LocaleEntity> fetch();
}

final class LocalizationPlatformDatasourceImpl
    implements ILocalizationPlatformDatasource {
  const LocalizationPlatformDatasourceImpl({
    required ILocalizationPlatformClient client,
  }) : _client = client;

  final ILocalizationPlatformClient _client;

  @override
  Future<LocaleEntity> fetch() async {
    final locale = await _client.fetch();
    return LocaleMapper.toEntity(from: locale);
  }
}
