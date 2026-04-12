import 'dart:async';

import 'package:inout_scenarios/src/data/data.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

final class InOutScenariosRepositoryImpl implements IInOutScenariosRepository {
  InOutScenariosRepositoryImpl({
    required IInOutScenariosRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IInOutScenariosRemoteDatasource _remoteSource;

  @override
  Future<List<InOutScenarioEntity>> fetchAll() async {
    return _remoteSource.fetchAll();
  }
}
