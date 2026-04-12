import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_response_model.freezed.dart';
part 'project_response_model.g.dart';

@Freezed(toJson: true)
class ProjectResponseModel with _$ProjectResponseModel {
  const ProjectResponseModel._();

  const factory ProjectResponseModel({
    required int id,
    required String name,
    required DateTime createdAt,
    required bool hasYandexAuth,
  }) = _ProjectResponseModel;

  @override
  Map<String, dynamic> toJson();
}
