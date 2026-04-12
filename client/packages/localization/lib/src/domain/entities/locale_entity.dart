import 'package:common/common.dart';

part 'locale_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class LocaleEntity with _$LocaleEntity {
  const LocaleEntity._();

  const factory LocaleEntity({
    required String languageCode,
    String? countryCode,
  }) = _LocaleEntity;
}
