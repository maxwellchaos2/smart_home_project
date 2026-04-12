import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class DeleteDeviceScope extends BlocScope<DeleteDeviceBloc, IDeleteDeviceController> {
  const DeleteDeviceScope({
    super.key,
    DeleteDeviceBloc? bloc,
    super.closeBlocOnDispose,
    required int deviceId,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _deviceId = deviceId,
        _projectId = projectId;

  DeleteDeviceScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int deviceId,
    required int projectId,
  })  : _bloc = context.read<DeleteDeviceBloc>(),
        _deviceId = deviceId,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final DeleteDeviceBloc? _bloc;
  final int _deviceId;
  final int _projectId;

  static IDeleteDeviceController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IDeleteDeviceController>(context, listen: listen);

  @override
  createController(bloc) => DeleteDeviceControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      DeleteDeviceBloc(
        repository: context.locator.get(),
        deviceId: _deviceId,
        projectId: _projectId,
      );
}

typedef DeleteDeviceBlocListener
    = BlocListener<DeleteDeviceBloc, DeleteDeviceState>;
