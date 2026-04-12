import 'package:common/common.dart';

import '../../domain.dart';

part 'input_proxy_channels_bloc.freezed.dart';
part 'input_proxy_channels_event.dart';
part 'input_proxy_channels_state.dart';

final class InputProxyChannelsBloc
    extends Bloc<InputProxyChannelsEvent, InputProxyChannelsState> {
  final IContentMgmtRepository _repository;

  final AccessInfoInputEntity _accessInfo;

  InputProxyChannelsBloc({
    required IContentMgmtRepository repository,
    required AccessInfoInputEntity accessInfo,
    List<InputProxyChannelEntity>? initData,
  })  : _repository = repository,
        _accessInfo = accessInfo,
        super(InputProxyChannelsState.initial(data: initData)) {
    on<InputProxyChannelsEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _fetch(_Fetch event, Emitter<InputProxyChannelsState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetchInputProxyChannels(
          accessInfo: _accessInfo,
        );
        emit(InputProxyChannelsState.success(data: data));
      });
}

extension on Emitter<InputProxyChannelsState> {
  Future<void> load(
      InputProxyChannelsState state, Future<void> Function() func) async {
    try {
      call(InputProxyChannelsState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(InputProxyChannelsState.failure(failure: e, data: state.data));
    } on Object {
      call(InputProxyChannelsState.failure(data: state.data));
      rethrow;
    }
  }
}
