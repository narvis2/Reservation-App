
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/reservation_detail_model.dart';
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';

class RequestReservationDetailUseCase {
  final ReservationRepository _reservationRepository;

  RequestReservationDetailUseCase(this._reservationRepository);

  Future<DataState<ReservationDetailModel>> invoke(int id) {
    return _reservationRepository.requestReservationDetail(id);
  }
}