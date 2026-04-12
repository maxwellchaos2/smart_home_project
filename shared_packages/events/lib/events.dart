library;

import 'package:common/common.dart';
import 'package:events/events.dart';
import 'package:events/src/di/di.dart';

export 'src/domain/domain.dart'
    show EventEntity, EventMessageInputEntity, IEventsRepository;

abstract final class EventsModule {
  static Future<void> init({
    required GetIt locator,
    required String wsUrl,
    String? authToken,
  }) async {
    await EventsDI.init(locator: locator, wsUrl: wsUrl, authToken: authToken);
    final repository = locator.get<IEventsRepository>();
    await repository.init();
  }
}
