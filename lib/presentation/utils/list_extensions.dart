/// 📌 List 의 확장함수
/// List 에서 map 을 사용할때 List 의 index 또한 같이 사용할 수 있음
extension ListExtensions<T> on List<T> {
  List<E> mapIndexed<E>(E Function(T item, int index) f) {
    List<E> result = [];
    for (int i = 0; i < length; i++) {
      result.add(f(this[i], i));
    }
    return result;
  }
}

/// 📌 Iterable 의 확장함수
/// Iterable 에서 map 을 사용할때 Iterable 의 index 또한 같이 사용할 수 있음
extension IterableExtensions<E> on Iterable<E> {
  List<T> mapIndexed<T>(T Function(E item, int index) f) {
    List<T> result = [];
    int index = 0;
    for (var item in this) {
      result.add(f(item, index));
      index++;
    }
    return result;
  }
}