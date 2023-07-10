import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

part 'reservation_event.dart';

part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationState.initial()) {
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
    emit(state.copyWith(currentPosition: event.processIndex));
  }

  void _setSelectedDate(
    ReservationDatePickerEvent event,
    Emitter<ReservationState> emit,
  ) {
    emit(state.copyWith(dateTime: event.selectedDateTime));
  }

  void _setSelectedTime(
    ReservationRadioTimeSelectEvent event,
    Emitter<ReservationState> emit,
  ) {
    emit(state.copyWith(selectedTime: event.selectedTime));
  }

  void _setSelectedCount(
    ReservationSelectedCountEvent event,
    Emitter<ReservationState> emit,
  ) {
    emit(state.copyWith(selectedCount: event.reservationCount));
  }
}
