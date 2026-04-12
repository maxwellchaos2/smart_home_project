import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class FloorsScope extends BlocScope<FloorsBloc, IFloorsController> {
  const FloorsScope({
    super.key,
    FloorsBloc? bloc,
    super.closeBlocOnDispose,
    required int projectId,
    List<FloorEntity>? initData,
    super.child,
  })  : _bloc = bloc,
        _projectId = projectId,
        _initData = initData;

  FloorsScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<FloorsBloc>(),
        _projectId = projectId,
        _initData = null,
        super(closeBlocOnDispose: false);
  
  final FloorsBloc? _bloc;
  final int _projectId;
  final List<FloorEntity>? _initData;

  static IFloorsController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IFloorsController>(context, listen: listen);

  @override
  createController(bloc) => FloorsControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      FloorsBloc(
        repository: context.locator.get(),
        projectId: _projectId,
        initData: _initData,
      );
}

typedef FloorsBlocListener
    = BlocListener<FloorsBloc, FloorsState>;
