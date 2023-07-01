import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

// SharedView Model 이라고 생각하면 될듯
class MainBloc extends Bloc<MainEvent, MainState> {
  // Event 등록
  MainBloc() : super(MainStateInitial()) {
    on<HomeTabLayoutCurrentPositionEvent>(
      (event, emit) => _setHomeTabLayoutCurrentPosition(
        event,
        emit,
      ),
    );
  }

  /*
    📌 ContentAreaComponent 에 있는 HomePagerScreen 의
    현재 Tab 의 position 을 저장
    즉, HomePagerScreen 의 currentPosition 을 저장
  */
  void _setHomeTabLayoutCurrentPosition(
    HomeTabLayoutCurrentPositionEvent event,
    Emitter<MainState> emit,
  ) {
    emit(HomeTabCurrentPositionState(event.currentPosition));
  }
}
