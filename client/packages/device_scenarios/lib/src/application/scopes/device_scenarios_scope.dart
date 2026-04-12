import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class DeviceScenariosScope extends BlocScope<DeviceScenariosBloc, IDeviceScenariosController> {
  const DeviceScenariosScope({
    super.key,
    DeviceScenariosBloc? bloc,
    super.closeBlocOnDispose,
    List<DeviceScenarioEntity>? initData,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _initData = initData,
        _projectId = projectId;

  DeviceScenariosScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<DeviceScenariosBloc>(),
        _initData = null,
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final DeviceScenariosBloc? _bloc;
  final List<DeviceScenarioEntity>? _initData;
  final int _projectId;

  static IDeviceScenariosController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IDeviceScenariosController>(context, listen: listen);

  @override
  createController(bloc) => DeviceScenariosControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      DeviceScenariosBloc(
        repository: context.locator.get(),
        initData: _initData,
        projectId: _projectId,
      );
}

typedef DeviceScenariosBlocListener
    = BlocListener<DeviceScenariosBloc, DeviceScenariosState>;
