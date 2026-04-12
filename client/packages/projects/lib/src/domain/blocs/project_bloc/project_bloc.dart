import 'package:common/common.dart';
import '../../domain.dart';

part 'project_event.dart';
part 'project_state.dart';
part 'project_bloc.freezed.dart';


final class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final IProjectsRepository _repository;

  ProjectBloc({
    required IProjectsRepository repository,
    ProjectEntity? initData,
  })  : _repository = repository,
        super(ProjectState.initial(data: initData)) {
    on<ProjectEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
      ),
    );
  }
  
  Future<void> _fetch(_Fetch event, Emitter<ProjectState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetch();
        emit(ProjectState.success(data: data));
      });
}
  extension on Emitter<ProjectState> {
    Future<void> load(ProjectState state, Future<void> Function() func) async {
      try {
        call(ProjectState.loading(data: state.data));
        await func();
      } on Failure catch (e) {
        call(ProjectState.failure(failure: e, data: state.data));
      } on Object {
        call(ProjectState.failure(data: state.data));
        rethrow;
      }
    }
  }

