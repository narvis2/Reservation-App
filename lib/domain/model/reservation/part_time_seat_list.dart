import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'part_time_seat_list.g.dart';

@JsonSerializable()
class PartTimeSeatList extends Equatable {
  final String seatCategory;
  final int seatCount;

  PartTimeSeatList({required this.seatCategory, required this.seatCount});

  factory PartTimeSeatList.fromJson(Map<String, dynamic> json) =>
      _$PartTimeSeatListFromJson(json);
  Map<String, dynamic> toJson() => _$PartTimeSeatListToJson(this);

  @override
  List<Object> get props => [seatCategory, seatCount];
}
