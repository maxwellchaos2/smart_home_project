import '../../domain/domain.dart';
import '../data.dart';

abstract final class LocaleMapper {
  static LocaleEntity toEntity({required LocaleModel from}) {
    return LocaleEntity(
      languageCode: from.languageCode,
      countryCode: from.countryCode,
    );
  }

  static LocaleModel toModel({required LocaleEntity from}) {
    return LocaleModel(
      languageCode: from.languageCode,
      countryCode: from.countryCode,
    );
  }
}
