import '../domain.dart';
  
abstract interface class ISearchZigbeeDevicesController {
  SearchZigbeeDevicesState get state;
    
  void startSearchZigbeeDevices();
}
  
final class SearchZigbeeDevicesControllerImpl implements ISearchZigbeeDevicesController {
  final SearchZigbeeDevicesBloc _bloc;
  const SearchZigbeeDevicesControllerImpl({required SearchZigbeeDevicesBloc bloc}) : _bloc = bloc;
  
  @override
  SearchZigbeeDevicesState get state => _bloc.state;
  
  @override
  void startSearchZigbeeDevices() => 
        _bloc.add(const SearchZigbeeDevicesEvent.startSearchZigbeeDevices());
}
