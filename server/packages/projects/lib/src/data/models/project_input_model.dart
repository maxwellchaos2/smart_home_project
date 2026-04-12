import 'package:common/common.dart';

part 'project_input_model.freezed.dart';
part 'project_input_model.g.dart';

@Freezed(toJson: true)
sealed class ProjectInputModel with _$ProjectInputModel {
  const ProjectInputModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProjectInputModel({
    required String name,
    required int userId,
  }) = _ProjectInputModel;

  @override
  Map<String, dynamic> toJson();
}
