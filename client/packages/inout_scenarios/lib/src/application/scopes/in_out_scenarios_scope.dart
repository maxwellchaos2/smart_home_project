import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class InOutScenariosScope extends BlocScope<InOutScenariosBloc, IInOutScenariosController> {
  const InOutScenariosScope({
    super.key,
    InOutScenariosBloc? bloc,
    super.closeBlocOnDispose,
    required int projectId,
    List<InOutScenarioEntity>? initData,
    super.child,
  })  : _bloc = bloc,
        _projectId = projectId,
        _initData = initData;

  InOutScenariosScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<InOutScenariosBloc>(),
        _projectId = projectId,
        _initData = null,
        super(closeBlocOnDispose: false);
  
  final InOutScenariosBloc? _bloc;
  final int _projectId;
  final List<InOutScenarioEntity>? _initData;

  static IInOutScenariosController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IInOutScenariosController>(context, listen: listen);

  @override
  createController(bloc) => InOutScenariosControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      InOutScenariosBloc(
        repository: context.locator.get(),
        projectId: _projectId,
        initData: _initData,
      );
}

typedef InOutScenariosBlocListener
    = BlocListener<InOutScenariosBloc, InOutScenariosState>;
