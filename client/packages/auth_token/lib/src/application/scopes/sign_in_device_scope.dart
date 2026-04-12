import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class SignInDeviceScope extends BlocScope<SignInDeviceBloc, ISignInDeviceController> {
  const SignInDeviceScope({
    super.key,
    SignInDeviceBloc? bloc,
    super.closeBlocOnDispose,
    super.child,
  })  : _bloc = bloc;

  SignInDeviceScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
  })  : _bloc = context.read<SignInDeviceBloc>(),
        super(closeBlocOnDispose: false);
  
  final SignInDeviceBloc? _bloc;

  static ISignInDeviceController of(BuildContext context, {bool listen = false}) =>
      Provider.of<ISignInDeviceController>(context, listen: listen);

  @override
  createController(bloc) => SignInDeviceControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      SignInDeviceBloc(
        repository: context.locator.get(),
      );
}

typedef SignInDeviceBlocListener
    = BlocListener<SignInDeviceBloc, SignInDeviceState>;
