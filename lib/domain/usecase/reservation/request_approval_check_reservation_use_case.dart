import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_approval_check_request_model.dart';
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';

class RequestApprovalCheckReservationUseCase {
  final ReservationRepository _reservationRepository;

  RequestApprovalCheckReservationUseCase(this._reservationRepository);

  Future<DataState> invoke(ReservationApprovalCheckRequestModel request) {
    return _reservationRepository.requestApprovalCheckReservation(request);
  }
}
