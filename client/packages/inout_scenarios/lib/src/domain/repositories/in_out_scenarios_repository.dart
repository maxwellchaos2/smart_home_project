import 'package:common/common.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

abstract interface class IInOutScenariosRepository {
  Future<List<InOutScenarioEntity>> fetchAll({
    required int projectId,
  });

  Future<InOutScenarioEntity> create({
    required InOutScenarioInputEntity input,
    required int projectId,
  });

  Future<InOutScenarioEntity> update({
    required int id,
    required InOutScenarioInputEntity input,
    required int projectId,
  });

  Future<void> delete({
    required int id,
    required int projectId,
  });

  Stream<ChangedEvent<InOutScenarioEntity>> get onChanged;

  void dispose();
}
