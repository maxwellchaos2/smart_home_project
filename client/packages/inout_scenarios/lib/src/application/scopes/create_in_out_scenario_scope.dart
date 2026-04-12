import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class CreateInOutScenarioScope extends BlocScope<CreateInOutScenarioBloc, ICreateInOutScenarioController> {
  const CreateInOutScenarioScope({
    super.key,
    CreateInOutScenarioBloc? bloc,
    super.closeBlocOnDispose,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _projectId = projectId;

  CreateInOutScenarioScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<CreateInOutScenarioBloc>(),
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final CreateInOutScenarioBloc? _bloc;
  final int _projectId;

  static ICreateInOutScenarioController of(BuildContext context, {bool listen = false}) =>
      Provider.of<ICreateInOutScenarioController>(context, listen: listen);

  @override
  createController(bloc) => CreateInOutScenarioControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      CreateInOutScenarioBloc(
        repository: context.locator.get(),
        projectId: _projectId,
      );
}

typedef CreateInOutScenarioBlocListener
    = BlocListener<CreateInOutScenarioBloc, CreateInOutScenarioState>;
