import 'package:common/common.dart';

import '../../domain.dart';

part 'wifi_name_bloc.freezed.dart';
part 'wifi_name_event.dart';
part 'wifi_name_state.dart';

final class WifiNameBloc extends Bloc<WifiNameEvent, WifiNameState> {
  final IWifiRepository _repository;

  WifiNameBloc({
    required IWifiRepository repository,
    String? initData,
  })  : _repository = repository,
        super(WifiNameState.initial(data: initData)) {
    on<WifiNameEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _fetch(_Fetch event, Emitter<WifiNameState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetchName();
        emit(WifiNameState.success(data: data));
      });
}

extension on Emitter<WifiNameState> {
  Future<void> load(WifiNameState state, Future<void> Function() func) async {
    try {
      call(WifiNameState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(WifiNameState.failure(failure: e, data: state.data));
    } on Object {
      call(WifiNameState.failure(data: state.data));
      rethrow;
    }
  }
}
