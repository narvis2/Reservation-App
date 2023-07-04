import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reservation_event.dart';

part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationCountPlusEvent>((event, emit) => _increment(event, emit));
    on<ReservationCountMinusEvent>((event, emit) => _decrement(event, emit));
  }

  void _increment(
    ReservationCountPlusEvent event,
    Emitter<ReservationState> emit,
  ) {
    final countState = ReservationCountState();
    if (countState.count >= 10) {
      return;
    }

    emit(countState.copyWith(count: countState.count + 1));
  }

  void _decrement(
    ReservationCountMinusEvent event,
    Emitter<ReservationState> emit,
  ) {
    final countState = ReservationCountState();
    if (countState.count >= 0) {
      return;
    }

    emit(countState.copyWith(count: countState.count - 1));
  }
}
