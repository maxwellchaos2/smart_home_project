import 'dart:async';

import 'package:common/common.dart';

import '../../domain.dart';

part 'auth_token_bloc.freezed.dart';
part 'auth_token_event.dart';
part 'auth_token_state.dart';

final class AuthTokenBloc extends Bloc<AuthTokenEvent, AuthTokenState> {
  final IAuthTokenRepository _repository;
  late final StreamSubscription _streamSubscription;
  AuthTokenBloc({
    required IAuthTokenRepository repository,
  })  : _repository = repository,
        super(const AuthTokenState.initial()) {
    on<AuthTokenEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
        changed: (event) => _changed(event, emit),
        revoke: (event) => _revoke(event, emit),
        update: (event) => _repository.updateToken(token: event.token),
      ),
    );
    _streamSubscription = repository.tokenChanged.listen(
      (token) => add(AuthTokenEvent.changed(token: token)),
    );
  }

  Future<void> _fetch(_Fetch event, Emitter<AuthTokenState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetchToken();
        emit(AuthTokenState.success(data: data));
      });

  Future<void> _revoke(_Revoke event, Emitter<AuthTokenState> emit) =>
      emit.load(state, () async {
        await _repository.revokeToken();
        emit(const AuthTokenState.success(data: null));
      });

  Future<void> _changed(_Changed event, Emitter<AuthTokenState> emit) async {
    emit(AuthTokenState.success(data: event.token));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}

extension on Emitter<AuthTokenState> {
  Future<void> load(AuthTokenState state, Future<void> Function() func) async {
    try {
      call(AuthTokenState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(AuthTokenState.failure(data: state.data, failure: e));
    } on Object {
      call(AuthTokenState.failure(data: state.data));
      rethrow;
    }
  }
}
