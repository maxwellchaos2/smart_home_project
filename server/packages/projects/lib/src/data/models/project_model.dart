import 'package:common/common.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@Freezed(fromJson: true)
sealed class ProjectModel with _$ProjectModel {
  const ProjectModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProjectModel({
    required int id,
    required String name,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime createdAt,
    required bool hasYandexAuth,
    required int userId,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, Object?> json) =>
      _$ProjectModelFromJson(json);
}

DateTime dateTimeFromJson(DateTime value) {
  return value;
}
