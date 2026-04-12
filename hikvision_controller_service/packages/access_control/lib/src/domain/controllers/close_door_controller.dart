import '../domain.dart';

abstract interface class ICloseDoorController {
  CloseDoorState get state;

  void close();

  Stream<CloseDoorState> get stateChanged;

  static ICloseDoorController create({
    required IAccessControlRepository repository,
    required int doorId,
  }) {
    final bloc = CloseDoorBloc(
      repository: repository,
      doorId: doorId,
    );
    return CloseDoorControllerImpl(bloc: bloc);
  }
}

final class CloseDoorControllerImpl implements ICloseDoorController {
  final CloseDoorBloc _bloc;
  const CloseDoorControllerImpl({required CloseDoorBloc bloc}) : _bloc = bloc;

  @override
  CloseDoorState get state => _bloc.state;

  @override
  Stream<CloseDoorState> get stateChanged => _bloc.stream;

  @override
  void close() => _bloc.add(const CloseDoorEvent.close());
}
