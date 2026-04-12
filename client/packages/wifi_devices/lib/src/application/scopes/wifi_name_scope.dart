import 'package:common/common.dart';

import '/src/domain/domain.dart';

final class WifiNameScope extends BlocScope<WifiNameBloc, IWifiNameController> {
  const WifiNameScope({
    super.key,
    WifiNameBloc? bloc,
    super.closeBlocOnDispose,
    String? initData,
    super.child,
  })  : _bloc = bloc,
        _initData = initData;

  WifiNameScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
  })  : _bloc = context.read<WifiNameBloc>(),
        _initData = null,
        super(closeBlocOnDispose: false);

  final WifiNameBloc? _bloc;
  final String? _initData;

  static IWifiNameController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IWifiNameController>(context, listen: listen);

  @override
  createController(bloc) => WifiNameControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      WifiNameBloc(
        repository: context.locator.get(),
        initData: _initData,
      );
}

typedef WifiNameBlocListener = BlocListener<WifiNameBloc, WifiNameState>;
