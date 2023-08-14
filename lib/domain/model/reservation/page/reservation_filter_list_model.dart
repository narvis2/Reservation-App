
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/reservation/page/reservation_filter_model.dart';

part 'reservation_filter_list_model.freezed.dart';

@freezed
class ReservationFilterListModel with _$ReservationFilterListModel {
  factory ReservationFilterListModel({
    required int totalCount,
    required int totalPages,
    required bool hasNext,
    required List<ReservationFilterModel> reservationList
  }) = _ReservationFilterListModel;
}