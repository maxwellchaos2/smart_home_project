library;

import 'package:common/common.dart';
import 'package:events/src/application/application.dart';
import 'package:events/src/di/di.dart';
import 'package:shelf_router/shelf_router.dart';

export 'src/application/application.dart'
    show EventResponseModel, EventResponseMapper;
export 'src/domain/domain.dart'
    show IEventsRepository, EventInputEntity, EventEntity;

abstract final class EventsModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await EventsDI.init(
      locator: locator,
    );

    registerWebSocketHandlers(locator);
  }
}
