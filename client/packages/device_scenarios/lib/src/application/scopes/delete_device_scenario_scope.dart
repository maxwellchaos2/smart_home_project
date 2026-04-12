import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class DeleteDeviceScenarioScope extends BlocScope<DeleteDeviceScenarioBloc, IDeleteDeviceScenarioController> {
  const DeleteDeviceScenarioScope({
    super.key,
    DeleteDeviceScenarioBloc? bloc,
    super.closeBlocOnDispose,
    required int scenarioId,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _scenarioId = scenarioId,
        _projectId = projectId;

  DeleteDeviceScenarioScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int scenarioId,
    required int projectId,
  })  : _bloc = context.read<DeleteDeviceScenarioBloc>(),
        _scenarioId = scenarioId,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final DeleteDeviceScenarioBloc? _bloc;
  final int _scenarioId;
  final int _projectId;

  static IDeleteDeviceScenarioController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IDeleteDeviceScenarioController>(context, listen: listen);

  @override
  createController(bloc) => DeleteDeviceScenarioControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      DeleteDeviceScenarioBloc(
        repository: context.locator.get(),
        scenarioId: _scenarioId,
        projectId: _projectId,
      );
}

typedef DeleteDeviceScenarioBlocListener
    = BlocListener<DeleteDeviceScenarioBloc, DeleteDeviceScenarioState>;
