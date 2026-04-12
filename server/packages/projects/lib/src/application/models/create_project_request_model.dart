import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_project_request_model.freezed.dart';
part 'create_project_request_model.g.dart';

@Freezed(fromJson: true)
class CreateProjectRequestModel with _$CreateProjectRequestModel {
  const CreateProjectRequestModel._();

  const factory CreateProjectRequestModel({
    required String name,
  }) = _CreateProjectRequestModel;

  factory CreateProjectRequestModel.fromJson(Map<String, Object?> json) =>
      _$CreateProjectRequestModelFromJson(json);
}
