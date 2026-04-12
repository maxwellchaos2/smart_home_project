import 'package:common/common.dart';

import '../../domain.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

final class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthTokenRepository _repository;

  SignInBloc({
    required IAuthTokenRepository repository,
  })  : _repository = repository,
        super(const SignInState.initial()) {
    on<SignInEvent>(
      (event, emit) => event.map(
        signIn: (event) => _signIn(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _signIn(_SignIn event, Emitter<SignInState> emit) =>
      emit.load(state, () async {
        final data = await _repository.signIn(data: event.data);
        emit(SignInState.success(data: data));
      });
}

extension on Emitter<SignInState> {
  Future<void> load(SignInState state, Future<void> Function() func) async {
    try {
      call(const SignInState.loading());
      await func();
    } on Failure catch (e) {
      call(SignInState.failure(failure: e));
    } on Object {
      call(const SignInState.failure());
      rethrow;
    }
  }
}
