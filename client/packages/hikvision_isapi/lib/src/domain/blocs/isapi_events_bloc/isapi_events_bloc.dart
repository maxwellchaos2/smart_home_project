import 'package:common/common.dart';

import '../../domain.dart';

part 'isapi_events_bloc.freezed.dart';
part 'isapi_events_event.dart';
part 'isapi_events_state.dart';

final class IsapiEventsBloc extends Bloc<IsapiEventsEvent, IsapiEventsState> {
  final IAccessControlRepository _repository;
  final int _pageSize;
  final AccessInfoInputEntity _accessInfo;

  IsapiEventsBloc({
    required IAccessControlRepository repository,
    int pageSize = 20,
    required AccessInfoInputEntity accessInfo,
  })  : _repository = repository,
        _pageSize = pageSize,
        _accessInfo = accessInfo,
        super(const IsapiEventsState.initial()) {
    on<_Paginate>(
      _paginate,
      transformer: droppable(),
    );

    on<IsapiEventsEvent>(
      (event, emit) => event.mapOrNull(
        refresh: (event) => _refresh(event, emit),
      ),
    );
  }

  IsapiEventInputEntity _getSearchInput() {
    return IsapiEventInputEntity(
      offset: state.data != null ? state.data!.length : 0,
      limit: _pageSize,
    );
  }

  Future<void> _paginate(_Paginate event, Emitter<IsapiEventsState> emit) =>
      emit.load(state, () async {
        final chunk = await _repository.fetchChunkEvents(
          accessInfo: _accessInfo,
          input: _getSearchInput(),
        );
        emit(
          IsapiEventsState.success(
            data: [...state.data ?? [], ...chunk.items],
            hasMore: chunk.totalSize >
                (state.data?.length ?? 0) + chunk.items.length,
          ),
        );
      });

  Future<void> _refresh(_Refresh event, Emitter<IsapiEventsState> emit) =>
      emit.load(state, () async {
        final chunk = await _repository.fetchChunkEvents(
          accessInfo: _accessInfo,
          input: IsapiEventInputEntity(
            offset: 0,
            limit: _pageSize,
          ),
        );
        emit(
          IsapiEventsState.success(
            data: chunk.items,
            hasMore: chunk.totalSize > chunk.items.length,
          ),
        );
      });
}

extension on Emitter<IsapiEventsState> {
  Future<void> load(
      IsapiEventsState state, Future<void> Function() func) async {
    try {
      call(IsapiEventsState.loading(
        data: state.data,
        hasMore: state.hasMore,
      ));
      await func();
    } on Failure catch (e) {
      call(IsapiEventsState.failure(
        data: state.data,
        failure: e,
        hasMore: state.hasMore,
      ));
    } on Object {
      call(IsapiEventsState.failure(
        data: state.data,
        hasMore: state.hasMore,
      ));
      rethrow;
    }
  }
}
