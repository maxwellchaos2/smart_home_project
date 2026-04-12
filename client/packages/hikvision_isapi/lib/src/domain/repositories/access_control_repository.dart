import 'package:hikvision_isapi/src/domain/domain.dart';

abstract interface class IAccessControlRepository {
  Future<IsapiEventsChunkEntity> fetchChunkEvents({
    required AccessInfoInputEntity accessInfo,
    required IsapiEventInputEntity input,
  });
}
