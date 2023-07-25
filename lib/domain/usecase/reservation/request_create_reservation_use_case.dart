
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_create_request_model.dart';
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';

class RequestCreateReservationUseCase {
  final ReservationRepository _reservationRepository;

  RequestCreateReservationUseCase(this._reservationRepository);

  Future<DataState<bool>> invoke(ReservationCreateRequestModel request) {
    return _reservationRepository.requestCreateReservation(request);
  }
}