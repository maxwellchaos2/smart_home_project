import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class CreateRoomScope extends BlocScope<CreateRoomBloc, ICreateRoomController> {
  const CreateRoomScope({
    super.key,
    CreateRoomBloc? bloc,
    super.closeBlocOnDispose,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _projectId = projectId;

  CreateRoomScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<CreateRoomBloc>(),
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final CreateRoomBloc? _bloc;
  final int _projectId;

  static ICreateRoomController of(BuildContext context, {bool listen = false}) =>
      Provider.of<ICreateRoomController>(context, listen: listen);

  @override
  createController(bloc) => CreateRoomControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      CreateRoomBloc(
        repository: context.locator.get(),
        projectId: _projectId,
      );
}

typedef CreateRoomBlocListener
    = BlocListener<CreateRoomBloc, CreateRoomState>;
