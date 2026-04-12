import 'package:localization/src/domain/domain.dart';

import '../data.dart';

abstract class ILocalizationLocalDatasource {
  Future<LocaleEntity?> fetch();
  Future<void> update({required LocaleEntity locale});
}

final class LocalizationLocalDatasourceImpl
    implements ILocalizationLocalDatasource {
  const LocalizationLocalDatasourceImpl({
    required ILocalizationStorageClient client,
  }) : _client = client;

  final ILocalizationStorageClient _client;

  @override
  Future<LocaleEntity?> fetch() async {
    final locale = await _client.fetch();
    if (locale == null) return null;
    return LocaleMapper.toEntity(from: locale);
  }

  @override
  Future<void> update({required LocaleEntity locale}) async {
    await _client.update(locale: LocaleMapper.toModel(from: locale));
  }
}
