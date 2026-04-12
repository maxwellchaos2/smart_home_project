import '../domain.dart';
  
abstract interface class IDeviceController {
  DeviceState get state;
    

}
  
final class DeviceControllerImpl implements IDeviceController {
  final DeviceBloc _bloc;
  const DeviceControllerImpl({required DeviceBloc bloc}) : _bloc = bloc;
  
  @override
  DeviceState get state => _bloc.state;
  

}
