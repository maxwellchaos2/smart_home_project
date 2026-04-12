import 'package:common/common.dart';

part 'project_input_entity.freezed.dart';

@freezed
sealed class ProjectInputEntity with _$ProjectInputEntity {
  const factory ProjectInputEntity({
    required String name,
    required int userId,
  }) = _ProjectInputEntity;
}
