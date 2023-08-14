import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/domain/model/reservation/enum/reservation_filter_type.dart';
import 'package:reservation_app/domain/model/reservation/page/reservation_filter_list_model.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_create_request_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_non_auth_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_date_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_part_time_seat_model.dart';

import '../../model/base/data_state.dart';

abstract class ReservationRepository {
  Future<DataState<List<ReservationTargetDateModel>>> getTargetDateReservation(
    DateTime date,
  );

  Future<DataState<List<ReservationTargetPartTimeSeatModel>>>
      getTargetPartTimeReservation(
    PartTime partTime,
    DateTime date,
    int count,
  );

  Future<DataState<bool>> requestCreateReservation(
    ReservationCreateRequestModel request,
  );

  Future<DataState<List<ReservationNonAuthModel>>> getReservationNonAuthList();

  Future<DataState<ReservationFilterListModel>>
      getReservationFilterPageList(
    int page,
    int limit,
    ReservationFilterType filterType,
  );
}
