import 'package:localization/src/data/models/locale_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalizationStorageClient {
  Future<LocaleModel?> fetch();
  Future<void> update({required LocaleModel locale});
}

final class LocalizationStorageClientImpl
    implements ILocalizationStorageClient {
  @override
  Future<LocaleModel?> fetch() async {
    final pref = await SharedPreferences.getInstance();
    final locale = pref.getString('locale');
    if (locale == null) return null;
    return LocaleModel.fromString(locale);
  }

  @override
  Future<void> update({required LocaleModel locale}) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('locale', locale.toString());
  }
}
