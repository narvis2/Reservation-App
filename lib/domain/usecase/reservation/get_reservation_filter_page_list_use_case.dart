import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/enum/reservation_filter_type.dart';
import 'package:reservation_app/domain/model/reservation/page/reservation_filter_list_model.dart';
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';

class GetReservationFilterPageListUseCase {
  final ReservationRepository _reservationRepository;
  GetReservationFilterPageListUseCase(this._reservationRepository);

  Future<DataState<ReservationFilterListModel>> invoke(
    int page,
    int limit,
    ReservationFilterType filterType,
  ) {
    return _reservationRepository.getReservationFilterPageList(
      page,
      limit,
      filterType,
    );
  }
}
