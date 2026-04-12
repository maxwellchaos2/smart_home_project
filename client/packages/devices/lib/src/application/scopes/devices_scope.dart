import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class DevicesScope extends BlocScope<DevicesBloc, IDevicesController> {
  const DevicesScope({
    super.key,
    DevicesBloc? bloc,
    super.closeBlocOnDispose,
    List<DeviceEntity>? initData,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _initData = initData,
        _projectId = projectId;

  DevicesScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<DevicesBloc>(),
        _initData = null,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final DevicesBloc? _bloc;
  final List<DeviceEntity>? _initData;
  final int _projectId;

  static IDevicesController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IDevicesController>(context, listen: listen);

  @override
  createController(bloc) => DevicesControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      DevicesBloc(
        repository: context.locator.get(),
        initData: _initData,
        projectId: _projectId,
      );
}

typedef DevicesBlocListener
    = BlocListener<DevicesBloc, DevicesState>;
