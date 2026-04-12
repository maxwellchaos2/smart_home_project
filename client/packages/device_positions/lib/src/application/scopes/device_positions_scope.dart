import 'package:common/common.dart';

import '/src/domain/domain.dart';

final class DevicePositionsScope
    extends BlocScope<DevicePositionsBloc, IDevicePositionsController> {
  const DevicePositionsScope({
    super.key,
    DevicePositionsBloc? bloc,
    super.closeBlocOnDispose,
    List<DevicePositionEntity>? initData,
    super.child,
  })  : _bloc = bloc,
        _initData = initData;

  DevicePositionsScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
  })  : _bloc = context.read<DevicePositionsBloc>(),
        _initData = null,
        super(closeBlocOnDispose: false);

  final DevicePositionsBloc? _bloc;
  final List<DevicePositionEntity>? _initData;

  static IDevicePositionsController of(BuildContext context,
          {bool listen = false}) =>
      Provider.of<IDevicePositionsController>(context, listen: listen);

  @override
  createController(bloc) => DevicePositionsControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      DevicePositionsBloc(
        repository: context.locator.get(),
        initData: _initData,
      );
}

typedef DevicePositionsBlocListener
    = BlocListener<DevicePositionsBloc, DevicePositionsState>;
