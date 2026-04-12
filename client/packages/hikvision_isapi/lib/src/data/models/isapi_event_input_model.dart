import 'package:common/common.dart';

part 'isapi_event_input_model.freezed.dart';
part 'isapi_event_input_model.g.dart';

@Freezed(toJson: true)
sealed class IsapiEventInputModel with _$IsapiEventInputModel {
  const IsapiEventInputModel._();

  const factory IsapiEventInputModel({
    required bool timeReverseOrder,
    required String searchID,
    required int searchResultPosition,
    required int maxResults,
    required int major,
    required int minor,
  }) = _IsapiEventInputModel;

  @override
  Map<String, dynamic> toJson();
}
