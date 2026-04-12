import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class UpdateDeviceScope extends BlocScope<UpdateDeviceBloc, IUpdateDeviceController> {
  const UpdateDeviceScope({
    super.key,
    UpdateDeviceBloc? bloc,
    super.closeBlocOnDispose,
    required int deviceId,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _deviceId = deviceId,
        _projectId = projectId;

  UpdateDeviceScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int deviceId,
    required int projectId,
  })  : _bloc = context.read<UpdateDeviceBloc>(),
        _deviceId = deviceId,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final UpdateDeviceBloc? _bloc;
  final int _deviceId;
  final int _projectId;

  static IUpdateDeviceController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IUpdateDeviceController>(context, listen: listen);

  @override
  createController(bloc) => UpdateDeviceControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      UpdateDeviceBloc(
        repository: context.locator.get(),
        deviceId: _deviceId,
        projectId: _projectId,
      );
}

typedef UpdateDeviceBlocListener
    = BlocListener<UpdateDeviceBloc, UpdateDeviceState>;
