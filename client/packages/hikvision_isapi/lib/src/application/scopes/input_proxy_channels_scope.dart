import 'package:common/common.dart';
import '/src/domain/domain.dart';

final class InputProxyChannelsScope extends BlocScope<InputProxyChannelsBloc, IInputProxyChannelsController> {
  const InputProxyChannelsScope({
    super.key,
    InputProxyChannelsBloc? bloc,
    super.closeBlocOnDispose,
    required AccessInfoInputEntity accessInfo,
    List<InputProxyChannelEntity>? initData,
    super.child,
  })  : _bloc = bloc,
        _accessInfo = accessInfo,
        _initData = initData;

  InputProxyChannelsScope.inherited(
    BuildContext context, {
    super.key,
    super.child,
    required AccessInfoInputEntity accessInfo,
  })  : _bloc = context.read<InputProxyChannelsBloc>(),
        _accessInfo = accessInfo,
        _initData = null,
        super(closeBlocOnDispose: false);
  
  final InputProxyChannelsBloc? _bloc;
  final AccessInfoInputEntity _accessInfo;
  final List<InputProxyChannelEntity>? _initData;

  static IInputProxyChannelsController of(BuildContext context, {bool listen = false}) =>
      Provider.of<IInputProxyChannelsController>(context, listen: listen);

  @override
  createController(bloc) => InputProxyChannelsControllerImpl(bloc: bloc);

  @override
  createBloc(context) =>
      _bloc ??
      InputProxyChannelsBloc(
        repository: context.locator.get(),
        accessInfo: _accessInfo,
        initData: _initData,
      );
}

typedef InputProxyChannelsBlocListener
    = BlocListener<InputProxyChannelsBloc, InputProxyChannelsState>;
