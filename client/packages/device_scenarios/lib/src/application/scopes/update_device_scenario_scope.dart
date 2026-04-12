import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class UpdateDeviceScenarioScope extends BlocScope<UpdateDeviceScenarioBloc, IUpdateDeviceScenarioController> {
  const UpdateDeviceScenarioScope({
    super.key,
    UpdateDeviceScenarioBloc? bloc,
    super.closeBlocOnDispose,
    required int scenarioId,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _scenarioId = scenarioId,
        _projectId = projectId;

  UpdateDeviceScenarioScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int scenarioId,
    required int projectId,
  })  : _bloc = context.read<UpdateDeviceScenarioBloc>(),
        _scenarioId = scenarioId,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final UpdateDeviceScenarioBloc? _bloc;
  final int _scenarioId;
  final int _projectId;

  static IUpdateDeviceScenarioController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IUpdateDeviceScenarioController>(context, listen: listen);

  @override
  createController(bloc) => UpdateDeviceScenarioControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      UpdateDeviceScenarioBloc(
        repository: context.locator.get(),
        scenarioId: _scenarioId,
        projectId: _projectId,
      );
}

typedef UpdateDeviceScenarioBlocListener
    = BlocListener<UpdateDeviceScenarioBloc, UpdateDeviceScenarioState>;
