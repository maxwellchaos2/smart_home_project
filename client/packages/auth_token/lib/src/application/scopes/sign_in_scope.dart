import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class SignInScope extends BlocScope<SignInBloc, ISignInController> {
  const SignInScope({
    super.key,
    SignInBloc? bloc,
    super.closeBlocOnDispose,
    super.child,
  })  : _bloc = bloc;

  SignInScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
  })  : _bloc = context.read<SignInBloc>(),
        super(closeBlocOnDispose: false);
  
  final SignInBloc? _bloc;

  static ISignInController of(BuildContext context, {bool listen = false}) =>
      Provider.of<ISignInController>(context, listen: listen);

  @override
  createController(bloc) => SignInControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      SignInBloc(
        repository: context.locator.get(),
      );
}

typedef SignInBlocListener
    = BlocListener<SignInBloc, SignInState>;
