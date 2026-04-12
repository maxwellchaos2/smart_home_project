import 'package:common/common.dart';

part 'isapi_event_model.freezed.dart';
part 'isapi_event_model.g.dart';

@Freezed(fromJson: true)
sealed class IsapiEventModel with _$IsapiEventModel {
  const IsapiEventModel._();

  const factory IsapiEventModel({
    required DateTime time,
    required int minor,
    required int major,
    required String? name,
  }) = _IsapiEventModel;

  factory IsapiEventModel.fromJson(Map<String, Object?> json) =>
      _$IsapiEventModelFromJson(json);
}
