import 'package:common/common.dart';

part 'locale_model.freezed.dart';

@freezed
sealed class LocaleModel with _$LocaleModel {
  const LocaleModel._();

  const factory LocaleModel({
    required String languageCode,
    required String? countryCode,
  }) = _LocaleModel;

  factory LocaleModel.fromString(String json) {
    final split = json.split('_');
    return LocaleModel(
      languageCode: split[0],
      countryCode: split.length > 1 ? split[1] : null,
    );
  }

  @override
  String toString() {
    return '$languageCode${countryCode != null ? '_$countryCode' : ''}';
  }
}
