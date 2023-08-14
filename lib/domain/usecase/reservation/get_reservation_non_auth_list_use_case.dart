
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/reservation_non_auth_model.dart';
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';

class GetReservationNonAuthListUseCase {
  final ReservationRepository _reservationRepository;
  GetReservationNonAuthListUseCase(this._reservationRepository);

  Future<DataState<List<ReservationNonAuthModel>>> invoke() {
    return _reservationRepository.getReservationNonAuthList();
  }
}