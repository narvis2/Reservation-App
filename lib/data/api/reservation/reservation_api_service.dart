import 'package:dio/dio.dart';
import 'package:reservation_app/data/common/response/response_base.dart';
import 'package:reservation_app/data/common/response/response_list_base.dart';
import 'package:reservation_app/data/model/reservation/page/reservation_filter_list_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_create_request.dart';
import 'package:reservation_app/data/model/reservation/reservation_non_auth_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_target_date_response.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/domain/model/reservation/enum/reservation_filter_type.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';
import 'package:retrofit/http.dart';

part 'reservation_api_service.g.dart';

@RestApi()
abstract class ReservationApiService {
  factory ReservationApiService(Dio dio, {String? baseUrl}) =
      _ReservationApiService;

  // PartTime 에 신경쓰지 않고 특정 날짜의 모든 좌석 List 를 가져옴
  @GET("/reservation/seats/date")
  Future<BaseListResponse<ReservationTargetDateResponse>>
      getTargetDateReservation(
    @Query("findDate") String date,
  );

  // 특정 날짜의 원하는 PartTime 에 남아있는 좌석 List 를 가져옴
  @GET("/reservation/seats")
  Future<BaseListResponse<SeatType>> getTargetPartTimeDateReservation(
    @Query("timeType") PartTime partTime,
    @Query("reservationDateTime") String date,
  );

  @POST("/reservation")
  Future<BaseResponse> requestCreateReservation(
    @Body() ReservationCreateRequest request,
  );

  @GET("/reservation/non-auth")
  Future<BaseListResponse<ReservationNonAuthResponse>>
      getNonAuthReservationList();

  @GET("/reservation/filter")
  Future<BaseResponse<ReservationFilterListResponse>>
      requestReservationFilterList(
    @Query("page") int page,
    @Query("size") int limit,
    @Query("filterType") ReservationFilterType filterType,
  );
}
