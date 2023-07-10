import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

part 'reservation_target_part_time_seat_model.g.dart';

@JsonSerializable()
class ReservationTargetPartTimeSeatModel extends Equatable {
  final SeatType remainSeatList;

  ReservationTargetPartTimeSeatModel({
    required this.remainSeatList,
  });

  factory ReservationTargetPartTimeSeatModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReservationTargetPartTimeSeatModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReservationTargetPartTimeSeatModelToJson(this);

  @override
  List<Object?> get props => [remainSeatList];
}
