import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class DeleteRoomScope extends BlocScope<DeleteRoomBloc, IDeleteRoomController> {
  const DeleteRoomScope({
    super.key,
    DeleteRoomBloc? bloc,
    super.closeBlocOnDispose,
    required int roomId,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _roomId = roomId,
        _projectId = projectId;

  DeleteRoomScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int roomId,
    required int projectId,
  })  : _bloc = context.read<DeleteRoomBloc>(),
        _roomId = roomId,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final DeleteRoomBloc? _bloc;
  final int _roomId;
  final int _projectId;

  static IDeleteRoomController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IDeleteRoomController>(context, listen: listen);

  @override
  createController(bloc) => DeleteRoomControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      DeleteRoomBloc(
        repository: context.locator.get(),
        roomId: _roomId,
        projectId: _projectId,
      );
}

typedef DeleteRoomBlocListener
    = BlocListener<DeleteRoomBloc, DeleteRoomState>;
