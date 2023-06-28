
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';

import '../../model/base/data_state.dart';
import '../../model/reservation/reservation_target_date_model.dart';

class GetTargetDateReservationUseCase {
  final ReservationRepository reservationRepository;

  GetTargetDateReservationUseCase(this.reservationRepository);

  Future<DataState<List<ReservationTargetDateModel>>> invoke(DateTime date) {
    return reservationRepository.getTargetDateReservation(date);
  }
}