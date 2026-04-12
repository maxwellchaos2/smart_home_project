import 'dart:io';

import 'package:localization/src/data/data.dart';

abstract class ILocalizationPlatformClient {
  Future<LocaleModel> fetch();
}

final class LocalizationPlatformClientImpl
    implements ILocalizationPlatformClient {
  @override
  Future<LocaleModel> fetch() async {
    return LocaleModel.fromString(Platform.localeName.split('.')[0]);
  }
}
