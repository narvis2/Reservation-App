// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_target_part_time_seat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationTargetPartTimeSeatModel _$ReservationTargetPartTimeSeatModelFromJson(
        Map<String, dynamic> json) =>
    ReservationTargetPartTimeSeatModel(
      remainSeatList: $enumDecode(_$SeatTypeEnumMap, json['remainSeatList']),
    );

Map<String, dynamic> _$ReservationTargetPartTimeSeatModelToJson(
        ReservationTargetPartTimeSeatModel instance) =>
    <String, dynamic>{
      'remainSeatList': _$SeatTypeEnumMap[instance.remainSeatList]!,
    };

const _$SeatTypeEnumMap = {
  SeatType.a1: 'A_1',
  SeatType.a2: 'A_2',
  SeatType.a3: 'A_3',
  SeatType.a4: 'A_4',
  SeatType.a5: 'A_5',
  SeatType.a6: 'A_6',
  SeatType.a7: 'A_7',
  SeatType.a8: 'A_8',
  SeatType.b: 'B',
  SeatType.c: 'C',
};
