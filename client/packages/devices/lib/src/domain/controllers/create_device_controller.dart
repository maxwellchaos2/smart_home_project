import '../domain.dart';
  
abstract interface class ICreateDeviceController {
  CreateDeviceState get state;
    
  void create({required DeviceInputEntity input});
}
  
final class CreateDeviceControllerImpl implements ICreateDeviceController {
  final CreateDeviceBloc _bloc;
  const CreateDeviceControllerImpl({required CreateDeviceBloc bloc}) : _bloc = bloc;
  
  @override
  CreateDeviceState get state => _bloc.state;
  
  @override
  void create({required DeviceInputEntity input}) => 
        _bloc.add(CreateDeviceEvent.create(input: input));
}
