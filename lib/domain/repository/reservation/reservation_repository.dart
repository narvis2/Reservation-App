
import 'package:reservation_app/domain/model/reservation/reservation_target_date_model.dart';

import '../../model/base/data_state.dart';

abstract class ReservationRepository {
  Future<DataState<List<ReservationTargetDateModel>>> getTargetDateReservation(DateTime date);
}