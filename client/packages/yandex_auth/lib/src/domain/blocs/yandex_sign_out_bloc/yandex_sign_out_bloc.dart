import 'package:common/common.dart';

import '../../domain.dart';

part 'yandex_sign_out_bloc.freezed.dart';
part 'yandex_sign_out_event.dart';
part 'yandex_sign_out_state.dart';

final class YandexSignOutBloc
    extends Bloc<YandexSignOutEvent, YandexSignOutState> {
  final IYandexAuthRepository _repository;

  YandexSignOutBloc({
    required IYandexAuthRepository repository,
  })  : _repository = repository,
        super(const YandexSignOutState.initial()) {
    on<YandexSignOutEvent>(
      (event, emit) => event.map(
        signOut: (event) => _signOut(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _signOut(_SignOut event, Emitter<YandexSignOutState> emit) =>
      emit.load(state, () async {
        await _repository.signOut();
        emit(YandexSignOutState.success());
      });
}

extension on Emitter<YandexSignOutState> {
  Future<void> load(
      YandexSignOutState state, Future<void> Function() func) async {
    try {
      call(const YandexSignOutState.loading());
      await func();
    } on Failure catch (e) {
      call(YandexSignOutState.failure(failure: e));
    } on Object {
      call(const YandexSignOutState.failure());
      rethrow;
    }
  }
}
