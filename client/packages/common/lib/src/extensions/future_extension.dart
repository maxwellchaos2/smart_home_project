extension FutureEx<T> on Future<T> {
  Future<T> minDelayed([Duration duration = const Duration(seconds: 1)]) async {
    await Future.wait([this, Future.delayed(duration)]);
    return this;
  }
}
