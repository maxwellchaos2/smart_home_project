import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class YandexSignOutScope extends BlocScope<YandexSignOutBloc, IYandexSignOutController> {
  const YandexSignOutScope({
    super.key,
    YandexSignOutBloc? bloc,
    super.closeBlocOnDispose,
    super.child,
  })  : _bloc = bloc;

  YandexSignOutScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
  })  : _bloc = context.read<YandexSignOutBloc>(),
        super(closeBlocOnDispose: false);
  
  final YandexSignOutBloc? _bloc;

  static IYandexSignOutController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IYandexSignOutController>(context, listen: listen);

  @override
  createController(bloc) => YandexSignOutControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      YandexSignOutBloc(
        repository: context.locator.get(),
      );
}

typedef YandexSignOutBlocListener
    = BlocListener<YandexSignOutBloc, YandexSignOutState>;
