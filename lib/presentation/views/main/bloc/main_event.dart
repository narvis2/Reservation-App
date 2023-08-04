part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

/*
  📌 ContentAreaComponent 에 있는 HomePagerScreen 의
  현재 Tab 의 position 을 저장
  즉, HomePagerScreen 의 currentPosition 을 저장
 */
class HomeTabLayoutCurrentPositionEvent extends MainEvent {
  final int currentPosition;
  HomeTabLayoutCurrentPositionEvent(this.currentPosition);

  @override
  List<Object?> get props => [currentPosition];

  @override
  bool? get stringify => false;
}