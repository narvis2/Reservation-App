import 'package:dio/dio.dart';
import 'package:reservation_app/data/model/reservation/reservation_target_date_response.dart';
import 'package:retrofit/http.dart';

import '../../../common/response/response_list_base.dart';

part 'reservation_api_service.g.dart';

@RestApi()
abstract class ReservationApiService {
  factory ReservationApiService(Dio dio, {String? baseUrl}) =
      _ReservationApiService;

  @GET("/reservation/seats/date")
  Future<BaseListResponse<ReservationTargetDateResponse>> getTargetDateReservation(
    @Query("findDate") String date,
  );
}
