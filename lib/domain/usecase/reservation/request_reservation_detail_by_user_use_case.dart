import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/reservation_detail_model.dart';
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';

class RequestReservationDetailByUserUseCase {
  final ReservationRepository _reservationRepository;

  RequestReservationDetailByUserUseCase(this._reservationRepository);

  Future<DataState<ReservationDetailModel>> invoke(String certificationNumber) {
    return _reservationRepository.requestReservationDetailByUser(
      certificationNumber,
    );
  }
}
