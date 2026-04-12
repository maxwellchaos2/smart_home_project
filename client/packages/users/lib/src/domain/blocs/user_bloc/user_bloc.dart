import 'package:common/common.dart';
import '../../domain.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';


final class UserBloc extends Bloc<UserEvent, UserState> {
  final IUsersRepository _repository;

  UserBloc({
    required IUsersRepository repository,
    UserEntity? initData,
  })  : _repository = repository,
        super(UserState.initial(data: initData)) {
    on<UserEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
      ),
    );
  }
  
  Future<void> _fetch(_Fetch event, Emitter<UserState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetch();
        emit(UserState.success(data: data));
      });
}
  extension on Emitter<UserState> {
    Future<void> load(UserState state, Future<void> Function() func) async {
      try {
        call(UserState.loading(data: state.data));
        await func();
      } on Failure catch (e) {
        call(UserState.failure(failure: e, data: state.data));
      } on Object {
        call(UserState.failure(data: state.data));
        rethrow;
      }
    }
  }

