import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class CreateDeviceScenarioScope extends BlocScope<CreateDeviceScenarioBloc, ICreateDeviceScenarioController> {
  const CreateDeviceScenarioScope({
    super.key,
    CreateDeviceScenarioBloc? bloc,
    super.closeBlocOnDispose,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _projectId = projectId;

  CreateDeviceScenarioScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<CreateDeviceScenarioBloc>(),
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final CreateDeviceScenarioBloc? _bloc;
  final int _projectId;

  static ICreateDeviceScenarioController of(BuildContext context, {bool listen = false}) =>
      Provider.of<ICreateDeviceScenarioController>(context, listen: listen);

  @override
  createController(bloc) => CreateDeviceScenarioControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      CreateDeviceScenarioBloc(
        repository: context.locator.get(),
        projectId: _projectId,
      );
}

typedef CreateDeviceScenarioBlocListener
    = BlocListener<CreateDeviceScenarioBloc, CreateDeviceScenarioState>;
