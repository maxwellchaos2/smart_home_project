import '../domain.dart';
  
abstract interface class ISignInDeviceController {
  SignInDeviceState get state;
    
  void signIn({required SignInDeviceInputEntity input});
}
  
final class SignInDeviceControllerImpl implements ISignInDeviceController {
  final SignInDeviceBloc _bloc;
  const SignInDeviceControllerImpl({required SignInDeviceBloc bloc}) : _bloc = bloc;
  
  @override
  SignInDeviceState get state => _bloc.state;
  
  @override
  void signIn({required SignInDeviceInputEntity input}) => 
        _bloc.add(SignInDeviceEvent.signIn(input: input));
}
