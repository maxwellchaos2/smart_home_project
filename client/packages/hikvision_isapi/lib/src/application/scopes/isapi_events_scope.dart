import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class IsapiEventsScope extends BlocScope<IsapiEventsBloc, IIsapiEventsController> {
  const IsapiEventsScope({
    super.key,
    IsapiEventsBloc? bloc,
    super.closeBlocOnDispose,
    int pageSize = 20,
    required AccessInfoInputEntity accessInfo,
    super.child,
  })  : _bloc = bloc,
        _pageSize = pageSize,
        _accessInfo = accessInfo;

  IsapiEventsScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    int pageSize = 20,
    required AccessInfoInputEntity accessInfo,
  })  : _bloc = context.read<IsapiEventsBloc>(),
        _pageSize = pageSize,
        _accessInfo = accessInfo,
        super(closeBlocOnDispose: false);
  
  final IsapiEventsBloc? _bloc;
  final int _pageSize;
  final AccessInfoInputEntity _accessInfo;

  static IIsapiEventsController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IIsapiEventsController>(context, listen: listen);

  @override
  createController(bloc) => IsapiEventsControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      IsapiEventsBloc(
        repository: context.locator.get(),
        pageSize: _pageSize,
        accessInfo: _accessInfo,
      );
}

typedef IsapiEventsBlocListener
    = BlocListener<IsapiEventsBloc, IsapiEventsState>;
