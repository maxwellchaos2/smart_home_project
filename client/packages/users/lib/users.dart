library;

import 'package:common/common.dart';
import 'package:users/src/di/di.dart';

export 'package:users/src/application/application.dart'
    show UserScope, UserBlocListener;

export 'package:users/src/domain/domain.dart' show UserEntity;

abstract final class UsersModule {
  static Future<void> init({required GetIt locator}) async {
    await UsersDI.init(locator: locator);
  }
}
