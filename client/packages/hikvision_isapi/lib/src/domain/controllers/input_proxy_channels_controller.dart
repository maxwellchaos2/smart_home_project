import '../domain.dart';
  
abstract interface class IInputProxyChannelsController {
  InputProxyChannelsState get state;
    
  void fetch();
}
  
final class InputProxyChannelsControllerImpl implements IInputProxyChannelsController {
  final InputProxyChannelsBloc _bloc;
  const InputProxyChannelsControllerImpl({required InputProxyChannelsBloc bloc}) : _bloc = bloc;
  
  @override
  InputProxyChannelsState get state => _bloc.state;
  
  @override
  void fetch() => 
        _bloc.add(const InputProxyChannelsEvent.fetch());
}
