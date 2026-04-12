import '../domain.dart';
  
abstract interface class IWifiNameController {
  WifiNameState get state;
    
  void fetch();
}
  
final class WifiNameControllerImpl implements IWifiNameController {
  final WifiNameBloc _bloc;
  const WifiNameControllerImpl({required WifiNameBloc bloc}) : _bloc = bloc;
  
  @override
  WifiNameState get state => _bloc.state;
  
  @override
  void fetch() => 
        _bloc.add(const WifiNameEvent.fetch());
}
