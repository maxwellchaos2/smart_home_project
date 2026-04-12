import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class UpdateInOutScenarioScope extends BlocScope<UpdateInOutScenarioBloc, IUpdateInOutScenarioController> {
  const UpdateInOutScenarioScope({
    super.key,
    UpdateInOutScenarioBloc? bloc,
    super.closeBlocOnDispose,
    required int scenarioId,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _scenarioId = scenarioId,
        _projectId = projectId;

  UpdateInOutScenarioScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int scenarioId,
    required int projectId,
  })  : _bloc = context.read<UpdateInOutScenarioBloc>(),
        _scenarioId = scenarioId,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final UpdateInOutScenarioBloc? _bloc;
  final int _scenarioId;
  final int _projectId;

  static IUpdateInOutScenarioController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IUpdateInOutScenarioController>(context, listen: listen);

  @override
  createController(bloc) => UpdateInOutScenarioControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      UpdateInOutScenarioBloc(
        repository: context.locator.get(),
        scenarioId: _scenarioId,
        projectId: _projectId,
      );
}

typedef UpdateInOutScenarioBlocListener
    = BlocListener<UpdateInOutScenarioBloc, UpdateInOutScenarioState>;
