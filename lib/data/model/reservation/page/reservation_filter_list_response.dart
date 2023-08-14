
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/data/model/reservation/page/reservation_filter_response.dart';

part 'reservation_filter_list_response.freezed.dart';
part 'reservation_filter_list_response.g.dart';

@freezed
class ReservationFilterListResponse with _$ReservationFilterListResponse {
  factory ReservationFilterListResponse({
    required int totalCount,
    required int totalPages,
    required bool hasNext,
    required List<ReservationFilterResponse> reservationList,
  }) = _ReservationFilterListResponse;

  factory ReservationFilterListResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationFilterListResponseFromJson(json);
}