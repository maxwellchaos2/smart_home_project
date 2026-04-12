import 'package:common/common.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@Freezed(fromJson: true)
sealed class ProjectModel with _$ProjectModel {
  const ProjectModel._();

  const factory ProjectModel({
    required int id,
    required String name,
    required DateTime createdAt,
    required bool hasYandexAuth,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, Object?> json) =>
      _$ProjectModelFromJson(json);
}
