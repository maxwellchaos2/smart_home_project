import 'package:common/common.dart';
import 'package:intl/intl.dart';
import 'package:localization/src/di/di.dart';

export 'src/application/application.dart'
    show LocalizationScope, LocalizationBuilder;
export 'src/domain/domain.dart' show LocaleEntity;
export 'src/l10n/app_localizations.dart';

abstract final class LocalizationModule {
  static Future<void> init({required GetIt locator}) async {
    Intl.defaultLocale = 'ru';
    await LocalizationDI.init(locator: locator);
  }
}
