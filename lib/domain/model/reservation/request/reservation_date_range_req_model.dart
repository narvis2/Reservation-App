
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_date_range_req_model.freezed.dart';

@freezed
class ReservationDateRangeReqModel with _$ReservationDateRangeReqModel  {

  factory ReservationDateRangeReqModel({
    required DateTime searchStartDate,
    required DateTime searchEndDate,
  }) = _ReservationDateRangeReqModel;
}