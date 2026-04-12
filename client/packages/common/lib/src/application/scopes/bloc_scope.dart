import 'package:common/common.dart';

abstract base class BlocScope<B extends Bloc, C>
    extends SingleChildStatelessWidget {
  const BlocScope({
    super.key,
    this.closeBlocOnDispose = true,
    super.child,
    this.lazy = true,
  });

  @protected
  @visibleForOverriding
  C createController(B bloc);

  @protected
  @visibleForOverriding
  B createBloc(BuildContext context);

  final bool closeBlocOnDispose;
  final bool lazy;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Provider<B>(
      create: createBloc,
      lazy: lazy,
      dispose: (context, bloc) => closeBlocOnDispose ? bloc.close() : null,
      child: Builder(builder: (context) {
        return InheritedProvider<C>(
          create: (context) => createController(context.read()),
          startListening: (e, c) => _startListening(e, context.read()),
          child: child,
        );
      }),
    );
  }

  VoidCallback _startListening(InheritedContext e, B bloc) {
    final subscription = bloc.stream.listen(
      (dynamic _) => e.markNeedsNotifyDependents(),
    );
    return subscription.cancel;
  }
}
