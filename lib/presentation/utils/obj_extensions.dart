/// Kotlin 의 let 처럼 사용
extension Let<T> on T {
  R let<R>(R Function(T) block) {
    return block(this);
  }
}