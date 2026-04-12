import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class AuthTokenScope extends BlocScope<AuthTokenBloc, IAuthTokenController> {
  const AuthTokenScope({
    super.key,
    AuthTokenBloc? bloc,
    super.closeBlocOnDispose,
    super.child,
  })  : _bloc = bloc;

  AuthTokenScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
  })  : _bloc = context.read<AuthTokenBloc>(),
        super(closeBlocOnDispose: false);
  
  final AuthTokenBloc? _bloc;

  static IAuthTokenController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IAuthTokenController>(context, listen: listen);

  @override
  createController(bloc) => AuthTokenControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      AuthTokenBloc(
        repository: context.locator.get(),
      );
}

typedef AuthTokenBlocListener
    = BlocListener<AuthTokenBloc, AuthTokenState>;
