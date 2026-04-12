import '../domain.dart';
  
abstract interface class IDeviceScenariosController {
  DeviceScenariosState get state;
    
  void fetch();
}
  
final class DeviceScenariosControllerImpl implements IDeviceScenariosController {
  final DeviceScenariosBloc _bloc;
  const DeviceScenariosControllerImpl({required DeviceScenariosBloc bloc}) : _bloc = bloc;
  
  @override
  DeviceScenariosState get state => _bloc.state;
  
  @override
  void fetch() => 
        _bloc.add(const DeviceScenariosEvent.fetch());
}
