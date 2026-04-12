import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class UpdateRoomScope extends BlocScope<UpdateRoomBloc, IUpdateRoomController> {
  const UpdateRoomScope({
    super.key,
    UpdateRoomBloc? bloc,
    super.closeBlocOnDispose,
    required int roomId,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _roomId = roomId,
        _projectId = projectId;

  UpdateRoomScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int roomId,
    required int projectId,
  })  : _bloc = context.read<UpdateRoomBloc>(),
        _roomId = roomId,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final UpdateRoomBloc? _bloc;
  final int _roomId;
  final int _projectId;

  static IUpdateRoomController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IUpdateRoomController>(context, listen: listen);

  @override
  createController(bloc) => UpdateRoomControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      UpdateRoomBloc(
        repository: context.locator.get(),
        roomId: _roomId,
        projectId: _projectId,
      );
}

typedef UpdateRoomBlocListener
    = BlocListener<UpdateRoomBloc, UpdateRoomState>;
