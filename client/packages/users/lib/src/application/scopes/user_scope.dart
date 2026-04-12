import 'package:common/common.dart';

import '/src/domain/domain.dart';

final class UserScope extends BlocScope<UserBloc, IUserController> {
  const UserScope({
    super.key,
    UserBloc? bloc,
    super.closeBlocOnDispose,
    UserEntity? initData,
    super.child,
  })  : _bloc = bloc,
        _initData = initData;

  UserScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
  })  : _bloc = context.read<UserBloc>(),
        _initData = null,
        super(closeBlocOnDispose: false);

  final UserBloc? _bloc;
  final UserEntity? _initData;

  static IUserController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IUserController>(context, listen: listen);

  @override
  createController(bloc) => UserControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      UserBloc(
        repository: context.locator.get(),
        initData: _initData,
      );
}

typedef UserBlocListener = BlocListener<UserBloc, UserState>;
