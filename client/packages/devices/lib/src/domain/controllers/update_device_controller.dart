import '../domain.dart';
  
abstract interface class IUpdateDeviceController {
  UpdateDeviceState get state;
    
  void update({required DeviceInputEntity input});
}
  
final class UpdateDeviceControllerImpl implements IUpdateDeviceController {
  final UpdateDeviceBloc _bloc;
  const UpdateDeviceControllerImpl({required UpdateDeviceBloc bloc}) : _bloc = bloc;
  
  @override
  UpdateDeviceState get state => _bloc.state;
  
  @override
  void update({required DeviceInputEntity input}) => 
        _bloc.add(UpdateDeviceEvent.update(input: input));
}
