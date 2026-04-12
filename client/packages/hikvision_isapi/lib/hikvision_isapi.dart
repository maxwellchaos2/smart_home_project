library;

import 'package:common/common.dart';

import 'src/di/di.dart';

export 'src/application/application.dart'
    show
        CameraArchiveScope,
        CameraArchiveBlocListener,
        IsapiEventsScope,
        IsapiEventsBlocListener,
        IsapiEventRow,
        IsapiEventsScreen,
        InputProxyChannelsScope,
        InputProxyChannelsBlocListener;
export 'src/data/data.dart'
    show IContentMgmtApiClient, RecordingMapper, ContentMgmtApiClientImpl;
export 'src/domain/domain.dart'
    show
        CameraArchiveBloc,
        CameraArchiveState,
        CameraArchiveStateX,
        IsapiEventEntity,
        AccessInfoInputEntity,
        InputProxyChannelEntity,
        RecordingSearchInputEntity,
        RecordingEntity;

abstract final class HikvisionISAPIModule {
  static Future<void> init({
    required GetIt locator,
  }) async {
    await HikvisionISAPIDI.init(
      locator: locator,
    );
  }
}
