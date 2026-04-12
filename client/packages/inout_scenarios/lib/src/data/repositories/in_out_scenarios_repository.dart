import 'dart:async';

import 'package:common/common.dart';
import 'package:inout_scenarios/src/data/data.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

final class InOutScenariosRepositoryImpl
    with InOutScenariosRepositoryChangedMixin
    implements IInOutScenariosRepository {
  InOutScenariosRepositoryImpl({
    required IInOutScenariosRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IInOutScenariosRemoteDatasource _remoteSource;

  @override
  Future<List<InOutScenarioEntity>> fetchAll({
    required int projectId,
  }) async {
    return _remoteSource.fetchAll(projectId: projectId);
  }

  @override
  Future<InOutScenarioEntity> create(
      {required InOutScenarioInputEntity input, required int projectId}) async {
    final data = await _remoteSource.create(input: input, projectId: projectId);
    _changedController.add(ChangedEvent.created(data));
    return data;
  }

  @override
  Future<void> delete({required int id, required int projectId}) async {
    await _remoteSource.delete(id: id, projectId: projectId);
    _changedController.add(ChangedEvent.deleted(itemId: id));
  }

  @override
  Future<InOutScenarioEntity> update({
    required int id,
    required InOutScenarioInputEntity input,
    required int projectId,
  }) async {
    final data =
        await _remoteSource.update(id: id, input: input, projectId: projectId);
    _changedController.add(ChangedEvent.updated(data));
    return data;
  }
}

mixin InOutScenariosRepositoryChangedMixin
    implements IInOutScenariosRepository {
  final _changedController =
      StreamController<ChangedEvent<InOutScenarioEntity>>.broadcast();

  @override
  Stream<ChangedEvent<InOutScenarioEntity>> get onChanged =>
      _changedController.stream;

  @override
  void dispose() {
    _changedController.close();
  }
}
