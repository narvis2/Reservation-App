
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

part 'reservation_detail_response.freezed.dart';
part 'reservation_detail_response.g.dart';

@freezed
class ReservationDetailResponse with _$ReservationDetailResponse {
  factory ReservationDetailResponse({
    required int id,
    required String name,
    required String phoneNumber,
    required String reservationDateTime,
    required int reservationCount,
    required bool isTermAllAgree,
    required bool isUserValidation,
    required List<SeatType> seats,
    String? certificationNumber,
  }) = _ReservationDetailResponse;

  factory ReservationDetailResponse.fromJson(Map<String, dynamic> json) => _$ReservationDetailResponseFromJson(json);
}