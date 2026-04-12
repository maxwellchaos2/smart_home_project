import 'package:common/common.dart';

abstract interface class IAppRunner {
  const IAppRunner({required this.locator});

  final GetIt locator;

  Future<void> preloadData({bool isBackgroundService = false});

  Future<void> run(IAppBuilder appBuilder);
}
