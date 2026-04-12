import '../domain.dart';

abstract interface class IOpenDoorController {
  OpenDoorState get state;

  void open();

  Stream<OpenDoorState> get stateChanged;

  static IOpenDoorController create({
    required IAccessControlRepository repository,
    required int doorId,
  }) {
    final bloc = OpenDoorBloc(
      repository: repository,
      doorId: doorId,
    );
    return OpenDoorControllerImpl(bloc: bloc);
  }
}

final class OpenDoorControllerImpl implements IOpenDoorController {
  final OpenDoorBloc _bloc;
  const OpenDoorControllerImpl({required OpenDoorBloc bloc}) : _bloc = bloc;

  @override
  OpenDoorState get state => _bloc.state;

  Stream<OpenDoorState> get stateChanged => _bloc.stream;

  @override
  void open() => _bloc.add(const OpenDoorEvent.open());
}
