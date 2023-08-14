// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReservationFilterResponse _$$_ReservationFilterResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ReservationFilterResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      reservationDateTime: json['reservationDateTime'] as String,
      reservationCount: json['reservationCount'] as int,
      partTime: $enumDecode(_$PartTimeEnumMap, json['timeType']),
      certificationNumber: json['certificationNumber'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$_ReservationFilterResponseToJson(
        _$_ReservationFilterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'reservationDateTime': instance.reservationDateTime,
      'reservationCount': instance.reservationCount,
      'timeType': _$PartTimeEnumMap[instance.partTime]!,
      'certificationNumber': instance.certificationNumber,
      'createdAt': instance.createdAt,
    };

const _$PartTimeEnumMap = {
  PartTime.partA: 'PART_A',
  PartTime.partB: 'PART_B',
  PartTime.partC: 'PART_C',
};
