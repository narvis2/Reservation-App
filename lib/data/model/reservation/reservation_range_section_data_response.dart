
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';

part 'reservation_range_section_data_response.g.dart';
part 'reservation_range_section_data_response.freezed.dart';

@freezed
class ReservationRangeSectionDataResponse with _$ReservationRangeSectionDataResponse {
  factory ReservationRangeSectionDataResponse({
    required int id,
    required String name,
    required String phoneNumber,
    required String reservationDateTime,
    required int reservationCount,
    required bool isTermAllAgree,
    required bool isUserValidation,
    String? certificationNumber,
    @JsonKey(name: 'timeType') required PartTime partTime,
  }) = _ReservationRangeSectionDataResponse;

  factory ReservationRangeSectionDataResponse.fromJson(Map<String, dynamic> json) => _$ReservationRangeSectionDataResponseFromJson(json);
}