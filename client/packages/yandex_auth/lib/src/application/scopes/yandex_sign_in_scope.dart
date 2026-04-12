import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class YandexSignInScope extends BlocScope<YandexSignInBloc, IYandexSignInController> {
  const YandexSignInScope({
    super.key,
    YandexSignInBloc? bloc,
    super.closeBlocOnDispose,
    super.child,
  })  : _bloc = bloc;

  YandexSignInScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
  })  : _bloc = context.read<YandexSignInBloc>(),
        super(closeBlocOnDispose: false);
  
  final YandexSignInBloc? _bloc;

  static IYandexSignInController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IYandexSignInController>(context, listen: listen);

  @override
  createController(bloc) => YandexSignInControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      YandexSignInBloc(
        repository: context.locator.get(),
      );
}

typedef YandexSignInBlocListener
    = BlocListener<YandexSignInBloc, YandexSignInState>;
