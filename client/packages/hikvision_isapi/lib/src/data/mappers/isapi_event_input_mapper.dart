import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class IsapiEventInputMapper {
  static IsapiEventInputModel toModel({required IsapiEventInputEntity from}) {
    return IsapiEventInputModel(
      timeReverseOrder: true,
      searchID: "123",
      searchResultPosition: from.offset,
      maxResults: from.limit,
      major: 0,
      minor: 0,
    );
  }
}
