import '../domain.dart';
  
abstract interface class IYandexSignOutController {
  YandexSignOutState get state;
    
  void signOut();
}
  
final class YandexSignOutControllerImpl implements IYandexSignOutController {
  final YandexSignOutBloc _bloc;
  const YandexSignOutControllerImpl({required YandexSignOutBloc bloc}) : _bloc = bloc;
  
  @override
  YandexSignOutState get state => _bloc.state;
  
  @override
  void signOut() => 
        _bloc.add(const YandexSignOutEvent.signOut());
}
