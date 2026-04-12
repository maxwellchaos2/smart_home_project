import 'package:inout_scenario/src/domain/domain.dart';

abstract interface class IInOutScenarioRepository {
  Future<bool> createTableIfNotExists();

  Future<List<InOutScenarioEntity>> fetchAll({int? projectId});

  Future<InOutScenarioEntity> create({required InOutScenarioInputEntity input});

  Future<InOutScenarioEntity> update(
      {required int id, required InOutScenarioInputEntity input});

  Future<void> delete({required int id});

  Future fetch({required int id});
}
