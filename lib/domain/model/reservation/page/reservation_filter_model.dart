
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';

part 'reservation_filter_model.freezed.dart';

@freezed
class ReservationFilterModel with _$ReservationFilterModel {
  factory ReservationFilterModel({
    required int id,
    required String name,
    required String phoneNumber,
    required String reservationTime,
    required int reservationCount,
    required PartTime partTime,
    required bool isAuthUser,
    String? createdAt,
  }) = _ReservationFilterModel;
}