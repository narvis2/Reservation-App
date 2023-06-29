import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

// SharedView Model 이라고 생각하면 될듯
class MainBloc extends Bloc<MainEvent, MainState> {
  // Event 등록
  MainBloc() : super(MainStateInitial()) {
    on<MainEvent>((event, emit) {});
  }
}
