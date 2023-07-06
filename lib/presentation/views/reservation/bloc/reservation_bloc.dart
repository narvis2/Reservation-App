import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reservation_event.dart';

part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationProcessState.initial()) {
    on<ReservationProcessEvent>(
      (event, emit) => _setProcessCurrentPosition(event, emit),
    );
    on<ReservationDatePickerEvent>(
      (event, emit) => _setSelectedDate(event, emit),
    );
    on<ReservationRadioTimeSelectEvent>(
      (event, emit) => _setSelectedTime(event, emit),
    );
    on<ReservationSelectedCountEvent>(
      (event, emit) => _setSelectedCount(event, emit),
    );
  }

  void _setProcessCurrentPosition(
    ReservationProcessEvent event,
    Emitter<ReservationState> emit,
  ) {

    if (state is ReservationProcessState) {
      emit(
        (state as ReservationProcessState).copyWith(currentPosition: event.processIndex),
      );
    }
  }

  void _setSelectedDate(
    ReservationDatePickerEvent event,
    Emitter<ReservationState> emit,
  ) {
    if (state is ReservationProcessState) {
      emit(
        (state as ReservationProcessState).copyWith(
          dateTime: event.selectedDateTime,
        ),
      );
    }
  }

  void _setSelectedTime(
    ReservationRadioTimeSelectEvent event,
    Emitter<ReservationState> emit,
  ) {
    if (state is ReservationProcessState) {
      emit(
        (state as ReservationProcessState).copyWith(
          selectedTime: event.selectedTime,
        ),
      );
    }
  }

  void _setSelectedCount(
    ReservationSelectedCountEvent event,
    Emitter<ReservationState> emit,
  ) {
    if (state is ReservationProcessState) {
      emit(
        (state as ReservationProcessState).copyWith(
          selectedCount: event.reservationCount,
        ),
      );
    }
  }
}
