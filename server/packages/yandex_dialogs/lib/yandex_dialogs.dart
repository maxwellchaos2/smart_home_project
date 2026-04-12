library yandex_dialogs;

import 'package:common/common.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:yandex_dialogs/src/application/handlers/handlers.dart';
import 'package:yandex_dialogs/src/di/di.dart';

export 'src/application/application.dart' show updateYandexDevicesStatusHandler;

abstract final class YandexDialogsModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
    required String skillId,
    required String oauthToken,
  }) async {
    registerRouterHandlers(router);

    await YandexDialogsDI.init(
      locator: locator,
      skillId: skillId,
      oauthToken: oauthToken,
    );
  }
}
