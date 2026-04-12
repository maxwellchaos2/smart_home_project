import 'package:localization/src/domain/domain.dart';

abstract interface class ILocalizationRepository {
  Future<LocaleEntity> fetch();
  Future<void> update({required LocaleEntity locale});
}
