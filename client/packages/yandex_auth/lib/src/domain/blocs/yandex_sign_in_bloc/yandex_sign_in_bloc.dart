import 'package:common/common.dart';

import '../../domain.dart';

part 'yandex_sign_in_bloc.freezed.dart';
part 'yandex_sign_in_event.dart';
part 'yandex_sign_in_state.dart';

final class YandexSignInBloc
    extends Bloc<YandexSignInEvent, YandexSignInState> {
  final IYandexAuthRepository _repository;

  YandexSignInBloc({
    required IYandexAuthRepository repository,
  })  : _repository = repository,
        super(const YandexSignInState.initial()) {
    on<YandexSignInEvent>(
      (event, emit) => event.map(
        signIn: (event) => _signIn(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _signIn(_SignIn event, Emitter<YandexSignInState> emit) =>
      emit.load(state, () async {
        await _repository.signIn(code: event.code);
        emit(YandexSignInState.success());
      });
}

extension on Emitter<YandexSignInState> {
  Future<void> load(
      YandexSignInState state, Future<void> Function() func) async {
    try {
      call(const YandexSignInState.loading());
      await func();
    } on Failure catch (e) {
      call(YandexSignInState.failure(failure: e));
    } on Object {
      call(const YandexSignInState.failure());
      rethrow;
    }
  }
}
