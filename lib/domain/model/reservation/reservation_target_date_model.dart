
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'part_time_seat_list.dart';

part 'reservation_target_date_model.g.dart';

// 📌 사용자에게 직업 보여줄 데이터만 가지고 있는 Model
@JsonSerializable()
class ReservationTargetDateModel extends Equatable {
  final String partTime;
  final List<PartTimeSeatList> remainsSeatList;

  ReservationTargetDateModel({
    required this.partTime,
    required this.remainsSeatList,
  });

  factory ReservationTargetDateModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationTargetDateModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReservationTargetDateModelToJson(this);

  @override
  List<Object> get props => [partTime, remainsSeatList];
}