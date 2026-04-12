import '../domain.dart';

abstract interface class IAppInfoController {
  AppInfoState get state;

  void fetch();
}

final class AppInfoControllerImpl implements IAppInfoController {
  final AppInfoBloc _bloc;
  const AppInfoControllerImpl({required AppInfoBloc bloc}) : _bloc = bloc;

  @override
  AppInfoState get state => _bloc.state;

  @override
  void fetch() => _bloc.add(const AppInfoEvent.fetch());
}
