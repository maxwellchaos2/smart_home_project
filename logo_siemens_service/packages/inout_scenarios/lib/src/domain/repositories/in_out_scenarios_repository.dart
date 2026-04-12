import 'package:inout_scenarios/src/domain/domain.dart';

abstract interface class IInOutScenariosRepository {
  Future<List<InOutScenarioEntity>> fetchAll();
}
