import '../domain.dart';
  
abstract interface class IUpdateYandexDevicesController {
  UpdateYandexDevicesState get state;
    
  void update();
}
  
final class UpdateYandexDevicesControllerImpl implements IUpdateYandexDevicesController {
  final UpdateYandexDevicesBloc _bloc;
  const UpdateYandexDevicesControllerImpl({required UpdateYandexDevicesBloc bloc}) : _bloc = bloc;
  
  @override
  UpdateYandexDevicesState get state => _bloc.state;
  
  @override
  void update() => 
        _bloc.add(const UpdateYandexDevicesEvent.update());
}
