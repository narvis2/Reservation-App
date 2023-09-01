
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_date_range_req_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_range_section_model.dart';
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';

class GetReservationRangeSectionListUseCase {
  final ReservationRepository _reservationRepository;
  GetReservationRangeSectionListUseCase(this._reservationRepository);

  Future<DataState<List<ReservationRangeSectionModel>>> invoke(ReservationDateRangeReqModel request) {
    return _reservationRepository.requestReservationRangeSectionList(request);
  }
}