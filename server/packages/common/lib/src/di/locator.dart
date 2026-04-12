class GetIt {
  GetIt();

  final _getItMap = <Type, Object>{};
  final _getItLazyMap = <Type, Object Function()>{};

  T get<T extends Object>() {
    if (_getItMap.containsKey(T)) return _getItMap[T] as T;
    if (_getItLazyMap.containsKey(T)) {
      final func = _getItLazyMap[T] as Object Function();
      final instance = func();
      _getItMap[T] = instance;
      return instance as T;
    } else {
      throw Exception('No registered instance of type $T');
    }
  }

  void registerLazySingleton<T extends Object>(T Function() func) {
    _getItLazyMap[T] = func;
  }

  void registerSingleton<T extends Object>(T instance) {
    _getItMap[T] = instance;
  }

  void reset() {
    _getItMap.clear();
    _getItLazyMap.clear();
  }
}
