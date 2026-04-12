import 'package:common/common.dart';

import '/src/domain/domain.dart';

final class CameraArchiveScope
    extends BlocScope<CameraArchiveBloc, ICameraArchiveController> {
  const CameraArchiveScope({
    super.key,
    CameraArchiveBloc? bloc,
    super.closeBlocOnDispose,
    required AccessInfoInputEntity accessInfo,
    required String trackId,
    super.child,
  })  : _bloc = bloc,
        _accessInfo = accessInfo,
        _trackId = trackId;

  CameraArchiveScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required AccessInfoInputEntity accessInfo,
    required String trackId,
  })  : _bloc = context.read<CameraArchiveBloc>(),
        _accessInfo = accessInfo,
        _trackId = trackId,
        super(closeBlocOnDispose: false);

  final CameraArchiveBloc? _bloc;
  final AccessInfoInputEntity _accessInfo;
  final String _trackId;

  static ICameraArchiveController of(BuildContext context,
          {bool listen = false}) =>
      Provider.of<ICameraArchiveController>(context, listen: listen);

  @override
  createController(bloc) => CameraArchiveControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      CameraArchiveBloc(
        repository: context.locator.get(),
        accessInfo: _accessInfo,
        trackId: _trackId,
      );
}

typedef CameraArchiveBlocListener
    = BlocListener<CameraArchiveBloc, CameraArchiveState>;
