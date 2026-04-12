import 'package:projects/src/domain/domain.dart';

abstract interface class IProjectsRepository {
  Future<ProjectEntity> fetch();
}
