import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';

part 'reservation_filter_response.g.dart';
part 'reservation_filter_response.freezed.dart';

@freezed
class ReservationFilterResponse with _$ReservationFilterResponse {
  factory ReservationFilterResponse({
    required int id,
    required String name,
    required String phoneNumber,
    required String reservationDateTime,
    required int reservationCount,
    @JsonKey(name: 'timeType') required PartTime partTime,
    String? certificationNumber,
    String? createdAt,
  }) = _ReservationFilterResponse;

  factory ReservationFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationFilterResponseFromJson(json);
}