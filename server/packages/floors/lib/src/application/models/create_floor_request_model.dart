import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_floor_request_model.freezed.dart';
part 'create_floor_request_model.g.dart';

@Freezed(fromJson: true)
class CreateFloorRequestModel with _$CreateFloorRequestModel {
  const CreateFloorRequestModel._();

  const factory CreateFloorRequestModel({
    required String name,
  }) = _CreateFloorRequestModel;

  factory CreateFloorRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateFloorRequestModelFromJson(json);
}
