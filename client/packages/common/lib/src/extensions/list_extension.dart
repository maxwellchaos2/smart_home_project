extension ListEx<T> on List<T> {
  bool replaceWhere(
    T newElement,
    bool Function(T element) test,
  ) {
    var index = 0;
    for (var element in this) {
      if (test(element)) {
        this[index] = newElement;
        return true;
      }
      index++;
    }
    return false;
  }

  void replaceOrAddWhere(
    T newElement,
    bool Function(T element) test,
  ) {
    if (!replaceWhere(newElement, test)) {
      insert(0, newElement);
    }
  }
}
