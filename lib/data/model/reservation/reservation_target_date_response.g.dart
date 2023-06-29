// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_target_date_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationTargetDateResponse _$ReservationTargetDateResponseFromJson(
        Map<String, dynamic> json) =>
    ReservationTargetDateResponse(
      partTime: json['partTime'] as String,
      remainsSeatList: (json['remainsSeatList'] as List<dynamic>)
          .map((e) => $enumDecode(_$SeatTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$ReservationTargetDateResponseToJson(
        ReservationTargetDateResponse instance) =>
    <String, dynamic>{
      'partTime': instance.partTime,
      'remainsSeatList':
          instance.remainsSeatList.map((e) => _$SeatTypeEnumMap[e]!).toList(),
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
