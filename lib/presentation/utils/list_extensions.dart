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