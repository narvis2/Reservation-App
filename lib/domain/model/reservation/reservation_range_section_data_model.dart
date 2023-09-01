
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';

part 'reservation_range_section_data_model.freezed.dart';

@freezed
class ReservationRangeSectionDataModel with _$ReservationRangeSectionDataModel {
  factory ReservationRangeSectionDataModel({
    required int id,
    required String name,
    required String phoneNumber,
    required String reservationDateTime,
    required int reservationCount,
    required bool isTermAllAgree,
    required bool isUserValidation,
    String? certificationNumber,
    required PartTime partTime,
  }) = _ReservationRangeSectionDataModel;
}