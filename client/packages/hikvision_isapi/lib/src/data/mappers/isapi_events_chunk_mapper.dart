import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class IsapiEventsMapper {
  static IsapiEventsChunkEntity toEntity(
      {required IsapiEventsChunkModel from}) {
    return IsapiEventsChunkEntity(
      items: from.InfoList.map((e) => IsapiEventMapper.toEntity(from: e))
          .toList(growable: false),
      totalSize: from.totalMatches,
    );
  }
}
