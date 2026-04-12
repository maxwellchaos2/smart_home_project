import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class CreateDeviceScope extends BlocScope<CreateDeviceBloc, ICreateDeviceController> {
  const CreateDeviceScope({
    super.key,
    CreateDeviceBloc? bloc,
    super.closeBlocOnDispose,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _projectId = projectId;

  CreateDeviceScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<CreateDeviceBloc>(),
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final CreateDeviceBloc? _bloc;
  final int _projectId;

  static ICreateDeviceController of(BuildContext context, {bool listen = false}) =>
      Provider.of<ICreateDeviceController>(context, listen: listen);

  @override
  createController(bloc) => CreateDeviceControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      CreateDeviceBloc(
        repository: context.locator.get(),
        projectId: _projectId,
      );
}

typedef CreateDeviceBlocListener
    = BlocListener<CreateDeviceBloc, CreateDeviceState>;
