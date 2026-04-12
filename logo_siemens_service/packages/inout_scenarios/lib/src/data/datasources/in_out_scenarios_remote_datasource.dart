import 'package:inout_scenarios/src/data/data.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

abstract interface class IInOutScenariosRemoteDatasource {
  Future<List<InOutScenarioEntity>> fetchAll();
}

final class InOutScenariosRemoteDatasourceImpl
    implements IInOutScenariosRemoteDatasource {
  const InOutScenariosRemoteDatasourceImpl(
      {required InOutScenariosApiClient client})
      : _client = client;

  final InOutScenariosApiClient _client;

  @override
  Future<List<InOutScenarioEntity>> fetchAll() async {
    final data = await _client.fetchAll();
    return data.map((e) => InOutScenarioMapper.toEntity(from: e)).toList();
  }
}
