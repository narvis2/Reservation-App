
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/domain/model/reservation/reservation_range_section_data_model.dart';

part 'reservation_range_section_model.freezed.dart';

@freezed
class ReservationRangeSectionModel with _$ReservationRangeSectionModel {
  factory ReservationRangeSectionModel({
    required String sectionTitle,
    required PartTime partTime,
    required List<ReservationRangeSectionDataModel> list,
  }) = _ReservationRangeSectionModel;
}