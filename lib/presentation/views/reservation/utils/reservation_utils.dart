import 'package:reservation_app/domain/model/reservation/reservation_target_part_time_seat_model.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

class ReservationUtils {
  static String partTimeToString({required int partTime}) {
    if (partTime == 0) {
      return "오후 1:00";
    } else if (partTime == 1) {
      return "오후 5:50";
    } else if (partTime == 2) {
      return "오후 8:00";
    } else {
      return "오후 1:00";
    }
  }

  static String reservationCountToString({required int count}) {
    if (count == 0) {
      return "여기는 좀 있다가..";
    } else if (count == 1) {
      return "4 인석";
    } else if (count == 2) {
      return "6 인석";
    } else {
      return "여기는 좀 있다가..";
    }
  }

  static List<SeatType> modelToSeatTypeList({
    required List<ReservationTargetPartTimeSeatModel> selectedSeatList,
  }) {
    return selectedSeatList
        .map((reservation) => reservation.remainSeatList)
        .toList();
  }
}
