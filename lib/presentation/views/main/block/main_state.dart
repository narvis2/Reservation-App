part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainStateInitial extends MainState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

/*
  📌 ContentAreaComponent 에 있는 HomePagerScreen 의
  현재 Tab 의 position 임 즉, HomePagerScreen 의 currentPosition
 */
class HomeTabCurrentPositionState extends MainState {
  final int currentPosition;
  HomeTabCurrentPositionState(this.currentPosition);

  @override
  // TODO: implement props
  List<Object?> get props => [currentPosition];

  @override
  bool? get stringify => false;
}