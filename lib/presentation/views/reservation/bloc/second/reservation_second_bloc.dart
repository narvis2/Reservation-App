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
    on<ReservationSecondEventSelectedSeats>(
      (event, emit) => _selectedRemainSeatList(
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

  void _selectedRemainSeatList(
    ReservationSecondEventSelectedSeats event,
    Emitter<ReservationSecondState> emit,
  ) {
    final state = this.state;
    if (state is ReservationSecondStateSeatList) {
      List<ReservationTargetPartTimeSeatModel> seatLists = state.seatLists;
      final currentSelectedList = state.seatLists.where((item) => item.isSelected).toList();

      /// 📌 Item 최대 선택 수 설정
      /// Item 이 최대 선택 수를 초과하면 이전의 선택된 데이터들은 전부 비선택으로 바꾸고,
      /// 현재 선택한 Item 만 선택으로 설정
      if (currentSelectedList.length == event.selectedLimitUserCount) {
        seatLists = seatLists.map((seat) {
          if (seat.isSelected) {
            return seat.copyWith(isSelected: false);
          } else {
            return seat;
          }
        }).toList();
      }

      final List<ReservationTargetPartTimeSeatModel> newSeatLists = seatLists.toList();

      final updatedSeatList = seatLists[event.currentItem].copyWith(
        isSelected: !seatLists[event.currentItem].isSelected,
      );

      newSeatLists[event.currentItem] = updatedSeatList;

      emit(ReservationSecondStateSeatList(seatLists: newSeatLists));
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
