library;

import 'package:common/common.dart';
import 'package:projects/src/di/di.dart';

export 'package:projects/src/application/application.dart'
    show ProjectScope, ProjectBlocListener;

export 'package:projects/src/domain/domain.dart' show ProjectEntity;

abstract final class ProjectsModule {
  static Future<void> init({required GetIt locator}) async {
    await ProjectsDI.init(locator: locator);
  }
}
