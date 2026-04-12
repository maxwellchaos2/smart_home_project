import '../domain.dart';
  
abstract interface class IDeleteDeviceController {
  DeleteDeviceState get state;
    
  void delete();
}
  
final class DeleteDeviceControllerImpl implements IDeleteDeviceController {
  final DeleteDeviceBloc _bloc;
  const DeleteDeviceControllerImpl({required DeleteDeviceBloc bloc}) : _bloc = bloc;
  
  @override
  DeleteDeviceState get state => _bloc.state;
  
  @override
  void delete() => 
        _bloc.add(const DeleteDeviceEvent.delete());
}
