import 'package:common/common.dart';

part 'project_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class ProjectEntity with _$ProjectEntity {
  const ProjectEntity._();

  const factory ProjectEntity({
    required int id,
    required String name,
    required DateTime createdAt,
    required bool hasYandexAuth,
  }) = _ProjectEntity;
}
