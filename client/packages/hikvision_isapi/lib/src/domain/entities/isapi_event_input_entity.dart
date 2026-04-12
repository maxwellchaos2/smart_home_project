import 'package:common/common.dart';

part 'isapi_event_input_entity.freezed.dart';

@freezed
sealed class IsapiEventInputEntity with _$IsapiEventInputEntity {
  const factory IsapiEventInputEntity({
    required int limit,
    required int offset,
  }) = _IsapiEventInputEntity;
}
