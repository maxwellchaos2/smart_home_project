import 'package:common/common.dart';

import '../../domain.dart';

part 'localization_bloc.freezed.dart';
part 'localization_event.dart';
part 'localization_state.dart';

final class LocalizationBloc
    extends Bloc<LocalizationEvent, LocalizationState> {
  final ILocalizationRepository _repository;

  LocalizationBloc({
    required ILocalizationRepository repository,
    LocaleEntity? initData,
  })  : _repository = repository,
        super(LocalizationState.initial(data: initData)) {
    on<LocalizationEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
        update: (event) => _update(event, emit),
      ),
    );
  }

  Future<void> _fetch(_Fetch event, Emitter<LocalizationState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetch();
        emit(LocalizationState.success(data: data));
      });

  Future<void> _update(_Update event, Emitter<LocalizationState> emit) =>
      emit.load(state, () async {
        await _repository.update(locale: event.locale);
        emit(LocalizationState.success(data: event.locale));
      });
}

extension on Emitter<LocalizationState> {
  Future<void> load(
      LocalizationState state, Future<void> Function() func) async {
    try {
      call(LocalizationState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(LocalizationState.failure(failure: e, data: state.data));
    } on Object {
      call(LocalizationState.failure(data: state.data));
      rethrow;
    }
  }
}
