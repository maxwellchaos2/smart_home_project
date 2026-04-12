import 'package:common/common.dart';

import '/src/domain/domain.dart';

final class LocalizationScope
    extends BlocScope<LocalizationBloc, ILocalizationController> {
  const LocalizationScope({
    super.key,
    LocalizationBloc? bloc,
    super.closeBlocOnDispose,
    LocaleEntity? initData,
    super.child,
  })  : _bloc = bloc,
        _initData = initData;

  final LocalizationBloc? _bloc;
  final LocaleEntity? _initData;

  static ILocalizationController of(BuildContext context,
          {bool listen = false}) =>
      Provider.of<ILocalizationController>(context, listen: listen);

  @override
  createController(bloc) => LocalizationControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      LocalizationBloc(
        repository: context.locator.get(),
        initData: _initData,
      );
}
