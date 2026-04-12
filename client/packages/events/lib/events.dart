library;

import 'package:common/common.dart';
import 'package:events/src/di/di.dart';

export 'src/application/application.dart' show EventsScope;
export 'src/domain/domain.dart'
    show
        EventEntity,
        EventMessageInputEntity,
        IEventsRepository,
        NewZigbeeDeviceEventEntity;

abstract final class EventsModule {
  static Future<void> init({required GetIt locator}) async {
    await EventsDI.init(locator: locator);
  }
}
