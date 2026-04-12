import '../domain.dart';
  
abstract interface class IProjectController {
  ProjectState get state;
    
  void fetch();
}
  
final class ProjectControllerImpl implements IProjectController {
  final ProjectBloc _bloc;
  const ProjectControllerImpl({required ProjectBloc bloc}) : _bloc = bloc;
  
  @override
  ProjectState get state => _bloc.state;
  
  @override
  void fetch() => 
        _bloc.add(const ProjectEvent.fetch());
}
