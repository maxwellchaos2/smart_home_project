library;

import 'package:common/common.dart';
import 'package:refresh_token/src/di/di.dart';
import 'package:shelf_router/shelf_router.dart';

export 'src/domain/domain.dart'
    show IRefreshTokenRepository, RefreshTokenInputEntity;

abstract final class RefreshTokenModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    await RefreshTokenDI.init(
      locator: locator,
    );
  }
}
