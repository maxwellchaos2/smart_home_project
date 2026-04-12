import '../domain.dart';
  
abstract interface class IYandexSignInController {
  YandexSignInState get state;
    
  void signIn({required String code});
}
  
final class YandexSignInControllerImpl implements IYandexSignInController {
  final YandexSignInBloc _bloc;
  const YandexSignInControllerImpl({required YandexSignInBloc bloc}) : _bloc = bloc;
  
  @override
  YandexSignInState get state => _bloc.state;
  
  @override
  void signIn({required String code}) => 
        _bloc.add(YandexSignInEvent.signIn(code: code));
}
