import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class DeleteInOutScenarioScope extends BlocScope<DeleteInOutScenarioBloc, IDeleteInOutScenarioController> {
  const DeleteInOutScenarioScope({
    super.key,
    DeleteInOutScenarioBloc? bloc,
    super.closeBlocOnDispose,
    required int scenarioId,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _scenarioId = scenarioId,
        _projectId = projectId;

  DeleteInOutScenarioScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int scenarioId,
    required int projectId,
  })  : _bloc = context.read<DeleteInOutScenarioBloc>(),
        _scenarioId = scenarioId,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final DeleteInOutScenarioBloc? _bloc;
  final int _scenarioId;
  final int _projectId;

  static IDeleteInOutScenarioController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IDeleteInOutScenarioController>(context, listen: listen);

  @override
  createController(bloc) => DeleteInOutScenarioControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      DeleteInOutScenarioBloc(
        repository: context.locator.get(),
        scenarioId: _scenarioId,
        projectId: _projectId,
      );
}

typedef DeleteInOutScenarioBlocListener
    = BlocListener<DeleteInOutScenarioBloc, DeleteInOutScenarioState>;
