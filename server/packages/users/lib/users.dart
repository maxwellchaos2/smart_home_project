library;

import 'package:common/common.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:users/src/application/application.dart';
import 'package:users/src/di/di.dart';

export 'src/application/application.dart'
    show checkRequestIsAdmin, checkRequestUserType;
export 'src/domain/domain.dart'
    show IUsersRepository, UserEntity, $UserEntityCopyWith, UserType;

abstract final class UsersModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await UsersDI.init(
      locator: locator,
    );
  }
}
