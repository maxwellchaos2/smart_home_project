import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class RoomsScope extends BlocScope<RoomsBloc, IRoomsController> {
  const RoomsScope({
    super.key,
    RoomsBloc? bloc,
    super.closeBlocOnDispose,
    List<RoomEntity>? initData,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _initData = initData,
        _projectId = projectId;

  RoomsScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<RoomsBloc>(),
        _initData = null,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final RoomsBloc? _bloc;
  final List<RoomEntity>? _initData;
  final int _projectId;

  static IRoomsController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IRoomsController>(context, listen: listen);

  @override
  createController(bloc) => RoomsControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      RoomsBloc(
        repository: context.locator.get(),
        initData: _initData,
        projectId: _projectId,
      );
}

typedef RoomsBlocListener
    = BlocListener<RoomsBloc, RoomsState>;
