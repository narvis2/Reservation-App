
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/data/model/reservation/reservation_range_section_data_response.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';

part 'reservation_range_section_response.g.dart';
part 'reservation_range_section_response.freezed.dart';

@freezed
class ReservationRangeSectionResponse with _$ReservationRangeSectionResponse {
  factory ReservationRangeSectionResponse({
    required String sectionTitle,
    @JsonKey(name: 'timeType') required PartTime partTime,
    required List<ReservationRangeSectionDataResponse> list,
  }) = _ReservationRangeSectionResponse;

  factory ReservationRangeSectionResponse.fromJson(Map<String, dynamic> json) => _$ReservationRangeSectionResponseFromJson(json);
}