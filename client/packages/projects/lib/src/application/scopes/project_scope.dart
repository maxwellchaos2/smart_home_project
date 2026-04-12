import 'package:common/common.dart';

import '/src/domain/domain.dart';

final class ProjectScope extends BlocScope<ProjectBloc, IProjectController> {
  const ProjectScope({
    super.key,
    ProjectBloc? bloc,
    super.closeBlocOnDispose,
    ProjectEntity? initData,
    super.child,
  })  : _bloc = bloc,
        _initData = initData;

  ProjectScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
  })  : _bloc = context.read<ProjectBloc>(),
        _initData = null,
        super(closeBlocOnDispose: false);

  final ProjectBloc? _bloc;
  final ProjectEntity? _initData;

  static IProjectController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IProjectController>(context, listen: listen);

  @override
  createController(bloc) => ProjectControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      ProjectBloc(
        repository: context.locator.get(),
        initData: _initData,
      );
}

typedef ProjectBlocListener = BlocListener<ProjectBloc, ProjectState>;
