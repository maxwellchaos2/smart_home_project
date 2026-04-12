import '../domain.dart';

abstract interface class ILocalizationController {
  LocalizationState get state;

  void fetch();
  void update({required LocaleEntity locale});
}

final class LocalizationControllerImpl implements ILocalizationController {
  final LocalizationBloc _bloc;
  const LocalizationControllerImpl({required LocalizationBloc bloc})
      : _bloc = bloc;

  @override
  LocalizationState get state => _bloc.state;

  @override
  void fetch() => _bloc.add(const LocalizationEvent.fetch());

  @override
  void update({required LocaleEntity locale}) =>
      _bloc.add(LocalizationEvent.update(locale: locale));
}
