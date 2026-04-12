import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class SearchZigbeeDevicesScope extends BlocScope<SearchZigbeeDevicesBloc, ISearchZigbeeDevicesController> {
  const SearchZigbeeDevicesScope({
    super.key,
    SearchZigbeeDevicesBloc? bloc,
    super.closeBlocOnDispose,
    required int projectId,
    super.child,
  })  : _bloc = bloc,
        _projectId = projectId;

  SearchZigbeeDevicesScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required int projectId,
  })  : _bloc = context.read<SearchZigbeeDevicesBloc>(),
        _projectId = projectId,
        super(closeBlocOnDispose: false);
  
  final SearchZigbeeDevicesBloc? _bloc;
  final int _projectId;

  static ISearchZigbeeDevicesController of(BuildContext context, {bool listen = false}) =>
      Provider.of<ISearchZigbeeDevicesController>(context, listen: listen);

  @override
  createController(bloc) => SearchZigbeeDevicesControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      SearchZigbeeDevicesBloc(
        repository: context.locator.get(),
        projectId: _projectId,
      );
}

typedef SearchZigbeeDevicesBlocListener
    = BlocListener<SearchZigbeeDevicesBloc, SearchZigbeeDevicesState>;
