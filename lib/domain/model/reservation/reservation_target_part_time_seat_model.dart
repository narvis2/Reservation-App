import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

part 'reservation_target_part_time_seat_model.g.dart';

@JsonSerializable()
class ReservationTargetPartTimeSeatModel extends Equatable {
  final SeatType remainSeatList;
  final bool isSelected;

  ReservationTargetPartTimeSeatModel({
    required this.remainSeatList,
    required this.isSelected,
  });

  factory ReservationTargetPartTimeSeatModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReservationTargetPartTimeSeatModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReservationTargetPartTimeSeatModelToJson(this);

  ReservationTargetPartTimeSeatModel copyWith({
    SeatType? remainSeatList,
    bool? isSelected,
  }) {
    return ReservationTargetPartTimeSeatModel(
      remainSeatList: remainSeatList ?? this.remainSeatList,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [remainSeatList, isSelected];

  @override
  bool? get stringify => true;
}
