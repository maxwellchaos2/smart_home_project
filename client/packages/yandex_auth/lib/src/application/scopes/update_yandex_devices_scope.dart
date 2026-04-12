import 'package:common/common.dart';

import '/src/domain/domain.dart';

final class UpdateYandexDevicesScope
    extends BlocScope<UpdateYandexDevicesBloc, IUpdateYandexDevicesController> {
  const UpdateYandexDevicesScope({
    super.key,
    UpdateYandexDevicesBloc? bloc,
    super.closeBlocOnDispose,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _projectId = projectId;

  UpdateYandexDevicesScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<UpdateYandexDevicesBloc>(),
        _projectId = projectId,
        super(closeBlocOnDispose: false);

  final UpdateYandexDevicesBloc? _bloc;
  final int _projectId;

  static IUpdateYandexDevicesController of(BuildContext context,
          {bool listen = false}) =>
      Provider.of<IUpdateYandexDevicesController>(context, listen: listen);

  @override
  createController(bloc) => UpdateYandexDevicesControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      UpdateYandexDevicesBloc(
        repository: context.locator.get(),
        projectId: _projectId,
      );
}

typedef UpdateYandexDevicesBlocListener
    = BlocListener<UpdateYandexDevicesBloc, UpdateYandexDevicesState>;
