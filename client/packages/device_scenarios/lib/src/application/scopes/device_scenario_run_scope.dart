import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class DeviceScenarioRunScope extends BlocScope<DeviceScenarioRunBloc, IDeviceScenarioRunController> {
  const DeviceScenarioRunScope({
    super.key,
    DeviceScenarioRunBloc? bloc,
    super.closeBlocOnDispose,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _projectId = projectId;

  DeviceScenarioRunScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<DeviceScenarioRunBloc>(),
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final DeviceScenarioRunBloc? _bloc;
  final int _projectId;

  static IDeviceScenarioRunController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IDeviceScenarioRunController>(context, listen: listen);

  @override
  createController(bloc) => DeviceScenarioRunControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      DeviceScenarioRunBloc(
        repository: context.locator.get(),
        projectId: _projectId,
      );
}

typedef DeviceScenarioRunBlocListener
    = BlocListener<DeviceScenarioRunBloc, DeviceScenarioRunState>;
