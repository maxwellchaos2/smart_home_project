import 'package:bloc/bloc.dart';

final class AppBlocObserver extends BlocObserver {
  static final List<Type> ignoreBlocsTypes = [];

  @override
  void onCreate(BlocBase bloc) {
    if (ignoreBlocsTypes.contains(bloc.runtimeType)) {
      return;
    }
    super.onCreate(bloc);
    // disable debugPrint for performance
    // debugPrint('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (ignoreBlocsTypes.contains(bloc.runtimeType)) {
      return;
    }
    super.onEvent(bloc, event);
    // disable debugPrint for performance
    // debugPrint('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (ignoreBlocsTypes.contains(bloc.runtimeType)) {
      return;
    }
    super.onChange(bloc, change);
    // disable debugPrint for performance
    // debugPrint('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (ignoreBlocsTypes.contains(bloc.runtimeType)) {
      return;
    }
    super.onTransition(bloc, transition);
    // disable debugPrint for performance
    // debugPrint('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (ignoreBlocsTypes.contains(bloc.runtimeType)) {
      return;
    }
    // disable debugPrint for performance
    // debugPrint('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    if (ignoreBlocsTypes.contains(bloc.runtimeType)) {
      return;
    }
    super.onClose(bloc);
    // disable debugPrint for performance
    // debugPrint('onClose -- ${bloc.runtimeType}');
  }
}
