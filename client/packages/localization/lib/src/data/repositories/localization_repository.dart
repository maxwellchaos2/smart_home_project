import '../../domain/domain.dart';
import '../data.dart';

final class LocalizationRepositoryImpl implements ILocalizationRepository {
  const LocalizationRepositoryImpl({
    required ILocalizationPlatformDatasource platformSource,
    required ILocalizationLocalDatasource localSource,
  })  : _platformSource = platformSource,
        _localSource = localSource;

  final ILocalizationPlatformDatasource _platformSource;
  final ILocalizationLocalDatasource _localSource;

  @override
  Future<LocaleEntity> fetch() async {
    final local = await _localSource.fetch();
    if (local != null) return local;
    final platform = await _platformSource.fetch();
    await _localSource.update(locale: platform);
    return platform;
  }

  @override
  Future<void> update({required LocaleEntity locale}) async {
    await _localSource.update(locale: locale);
  }
}
