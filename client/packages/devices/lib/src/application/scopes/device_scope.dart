import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class DeviceScope extends BlocScope<DeviceBloc, IDeviceController> {
  const DeviceScope({
    super.key,
    DeviceBloc? bloc,
    super.closeBlocOnDispose,
    DeviceEntity? initData,
    required int deviceId,
    super.child,
  })  : _bloc = bloc,
        _initData = initData,
        _deviceId = deviceId;

  DeviceScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int deviceId,
  })  : _bloc = context.read<DeviceBloc>(),
        _initData = null,
        _deviceId = deviceId,
        super(closeBlocOnDispose: false);
  
  final DeviceBloc? _bloc;
  final DeviceEntity? _initData;
  final int _deviceId;

  static IDeviceController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IDeviceController>(context, listen: listen);

  @override
  createController(bloc) => DeviceControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      DeviceBloc(
        repository: context.locator.get(),
        initData: _initData,
        deviceId: _deviceId,
      );
}

typedef DeviceBlocListener
    = BlocListener<DeviceBloc, DeviceState>;
