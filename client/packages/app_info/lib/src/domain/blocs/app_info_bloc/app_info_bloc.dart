import 'package:common/common.dart';
import '../../domain.dart';

part 'app_info_event.dart';
part 'app_info_state.dart';
part 'app_info_bloc.freezed.dart';


final class AppInfoBloc extends Bloc<AppInfoEvent, AppInfoState> {
  final IAppInfoRepository _repository;

  AppInfoBloc({
    required IAppInfoRepository repository,
    AppInfoEntity? initData,
  })  : _repository = repository,
        super(AppInfoState.initial(data: initData)) {
    on<AppInfoEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
      ),
    );
  }
  
  Future<void> _fetch(_Fetch event, Emitter<AppInfoState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetch();
        emit(AppInfoState.success(data: data));
      });
}
  extension on Emitter<AppInfoState> {
    Future<void> load(AppInfoState state, Future<void> Function() func) async {
      try {
        call(AppInfoState.loading(data: state.data));
        await func();
      } on Failure catch (e) {
        call(AppInfoState.failure(failure: e, data: state.data));
      } on Object {
        call(AppInfoState.failure(data: state.data));
        rethrow;
      }
    }
  }

