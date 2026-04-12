import '../domain.dart';
  
abstract interface class IDevicePositionsController {
  DevicePositionsState get state;
    
  void fetchAll();
}
  
final class DevicePositionsControllerImpl implements IDevicePositionsController {
  final DevicePositionsBloc _bloc;
  const DevicePositionsControllerImpl({required DevicePositionsBloc bloc}) : _bloc = bloc;
  
  @override
  DevicePositionsState get state => _bloc.state;
  
  @override
  void fetchAll() => 
        _bloc.add(const DevicePositionsEvent.fetchAll());
}
