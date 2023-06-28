
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

part 'reservation_target_date_response.g.dart';

// 📌 서버에서 넘어오는 원본 Response 데이터
@JsonSerializable()
class ReservationTargetDateResponse extends Equatable {
  final String partTime;
  final List<SeatType> remainsSeatList;

  ReservationTargetDateResponse({
    required this.partTime,
    required this.remainsSeatList
  });

  factory ReservationTargetDateResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationTargetDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationTargetDateResponseToJson(this);

  @override
  List<Object> get props => [partTime, remainsSeatList];
}