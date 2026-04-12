import 'package:common/common.dart';

import '/src/domain/domain.dart';

final class AppInfoScope extends BlocScope<AppInfoBloc, IAppInfoController> {
  const AppInfoScope({
    super.key,
    AppInfoBloc? bloc,
    super.closeBlocOnDispose,
    AppInfoEntity? initData,
    super.child,
  })  : _bloc = bloc,
        _initData = initData;

  AppInfoScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
  })  : _bloc = context.read<AppInfoBloc>(),
        _initData = null,
        super(closeBlocOnDispose: false);

  final AppInfoBloc? _bloc;
  final AppInfoEntity? _initData;

  static IAppInfoController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IAppInfoController>(context, listen: listen);

  @override
  createController(bloc) => AppInfoControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      AppInfoBloc(
        repository: context.locator.get(),
        initData: _initData,
      );
}

typedef AppInfoBlocListener = BlocListener<AppInfoBloc, AppInfoState>;
