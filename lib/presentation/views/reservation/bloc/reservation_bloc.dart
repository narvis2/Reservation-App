import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

part 'reservation_event.dart';

part 'reservation_state.dart';

// 📌 예약정보에 관한 State 를 관리하는 Bloc
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
    on<ReservationSelectedSeatsEvent>(
      (event, emit) => _setSelectedSeatList(event, emit),
    );
    on<ReservationInputRealUserCountAddEvent>(
      (event, emit) => _setInputRealUserCountAdd(event, emit),
    );
    on<ReservationInputRealUserCountMinusEvent>(
      (event, emit) => _setInputRealUserCountMinus(event, emit),
    );
    on<ReservationTermAllAgreeEvent>(
      (event, emit) => _setTermIsAllAgree(event, emit),
    );
    on<ReservationUserAuthEvent>(
      (event, emit) => _setIsCheckedAuth(event, emit),
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

    if (event.reservationCount == 0) {
      emit(state.copyWith(realUserCount: 1));
    } else if (event.reservationCount == 1) {
      emit(state.copyWith(realUserCount: 4));
    } else if (event.reservationCount == 2) {
      emit(state.copyWith(realUserCount: 6));
    }
  }

  void _setSelectedSeatList(
    ReservationSelectedSeatsEvent event,
    Emitter<ReservationState> emit,
  ) {
    emit(state.copyWith(selectedSeats: event.selectedSeatList));
  }

  void _setInputRealUserCountAdd(
    ReservationInputRealUserCountAddEvent event,
    Emitter<ReservationState> emit,
  ) {
    if (state.selectedCount == 0 && state.realUserCount == 3) {
      return;
    }

    if (state.selectedCount == 1 && state.realUserCount == 5) {
      return;
    }

    if (state.selectedCount == 2 && state.realUserCount == 8) {
      return;
    }

    emit(state.copyWith(realUserCount: state.realUserCount + 1));
  }

  void _setInputRealUserCountMinus(
    ReservationInputRealUserCountMinusEvent event,
    Emitter<ReservationState> emit,
  ) {
    if (state.selectedCount == 0 && state.realUserCount == 1) {
      return;
    }

    if (state.selectedCount == 1 && state.realUserCount == 4) {
      return;
    }

    if (state.selectedCount == 2 && state.realUserCount == 6) {
      return;
    }

    emit(state.copyWith(realUserCount: state.realUserCount - 1));
  }

  void _setTermIsAllAgree(
    ReservationTermAllAgreeEvent event,
    Emitter<ReservationState> emit,
  ) {
    emit(state.copyWith(termIsAllAgree: event.isAllSelected));
  }

  void _setIsCheckedAuth(
    ReservationUserAuthEvent event,
    Emitter<ReservationState> emit,
  ) {
    emit(state.copyWith(isCheckedAuth: event.isCheckedAuth));
  }
}
