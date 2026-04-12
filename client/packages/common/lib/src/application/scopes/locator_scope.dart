import '../../../common.dart';

class LocatorScope extends SingleChildStatelessWidget {
  const LocatorScope({
    super.key,
    required GetIt Function(BuildContext) create,
    super.child,
  }) : _create = create;

  final GetIt Function(BuildContext context) _create;

  static T get<T extends Object>(BuildContext context) =>
      context.read<GetIt>().get<T>();

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Provider<GetIt>(
      create: _create,
      dispose: (_, locator) => locator.reset(),
      child: child,
    );
  }
}
