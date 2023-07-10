import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_part_time_seat_model.dart';
import 'package:reservation_app/domain/usecase/reservation/get_reservation_target_part_time_use_case.dart';
import 'package:reservation_app/presentation/utils/constants.dart';

part 'reservation_second_event.dart';

part 'reservation_second_state.dart';

class ReservationSecondBloc
    extends Bloc<ReservationSecondEvent, ReservationSecondState> {
  final GetReservationTargetPartTimeUseCase getReservationTargetPartTimeUseCase;

  ReservationSecondBloc(this.getReservationTargetPartTimeUseCase)
      : super(ReservationSecondInitial()) {
    on<ReservationSecondEventGetSeatList>(
      (event, emit) => _getRemainSeatList(
        event,
        emit,
      ),
    );
  }

  void _getRemainSeatList(
    ReservationSecondEventGetSeatList event,
    Emitter<ReservationSecondState> emit,
  ) async {
    emit(const ReservationSecondStateLoading());

    final selectedTime = event.date;
    if (selectedTime == null) {
      emit(ReservationSecondStateNoSelectedDateTime());
      return;
    }

    final response = await getReservationTargetPartTimeUseCase.invoke(
      _numberToPartTime(selectedTime: event.partTime),
      selectedTime,
      _countToReservationCount(count: event.count),
    );

    if (response is DataSuccess) {
      debugPrint(
        "🌹 ReservationSecondBloc Success Data 👉 ${response.data ?? []}",
      );
      emit(ReservationSecondStateSeatList(seatLists: response.data ?? []));
    } else if (response is DataError) {
      debugPrint(
        "🌹 ReservationSecondBloc DataError message 👉 ${response.error?.message}",
      );
      emit(ReservationSecondStateFailed(message: Constants.dataError));
    } else if (response is DataNetworkError) {
      debugPrint(
        "🌹 ReservationSecondBloc NetworkError message 👉 ${response.error?.message}",
      );
      emit(ReservationSecondStateFailed(message: Constants.networkError));
    } else {
      debugPrint(
        "🌹 ReservationSecondBloc DataError message 👉 ${response.error?.message}",
      );
      emit(ReservationSecondStateFailed(message: Constants.dataError));
    }
  }

  PartTime _numberToPartTime({required int selectedTime}) {
    return selectedTime == 0
        ? PartTime.partA
        : selectedTime == 1
            ? PartTime.partB
            : selectedTime == 2
                ? PartTime.partC
                : PartTime.partA;
  }

  int _countToReservationCount({required int count}) {
    return count == 0
        ? 3
        : count == 1
            ? 4
            : count == 2
                ? 6
                : 3;
  }
}
