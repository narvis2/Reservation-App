import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_part_time_seat_model.dart';
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';

class GetReservationTargetPartTimeUseCase {
  final ReservationRepository _reservationRepository;

  GetReservationTargetPartTimeUseCase(this._reservationRepository);

  Future<DataState<List<ReservationTargetPartTimeSeatModel>>> invoke(
    PartTime partTime,
    DateTime date,
    int count,
  ) {
    return _reservationRepository.getTargetPartTimeReservation(partTime, date, count);
  }
}
