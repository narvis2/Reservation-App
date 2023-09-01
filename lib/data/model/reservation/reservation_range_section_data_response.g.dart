// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_range_section_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReservationRangeSectionDataResponse
    _$$_ReservationRangeSectionDataResponseFromJson(
            Map<String, dynamic> json) =>
        _$_ReservationRangeSectionDataResponse(
          id: json['id'] as int,
          name: json['name'] as String,
          phoneNumber: json['phoneNumber'] as String,
          reservationDateTime: json['reservationDateTime'] as String,
          reservationCount: json['reservationCount'] as int,
          isTermAllAgree: json['isTermAllAgree'] as bool,
          isUserValidation: json['isUserValidation'] as bool,
          certificationNumber: json['certificationNumber'] as String?,
          partTime: $enumDecode(_$PartTimeEnumMap, json['timeType']),
        );

Map<String, dynamic> _$$_ReservationRangeSectionDataResponseToJson(
        _$_ReservationRangeSectionDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'reservationDateTime': instance.reservationDateTime,
      'reservationCount': instance.reservationCount,
      'isTermAllAgree': instance.isTermAllAgree,
      'isUserValidation': instance.isUserValidation,
      'certificationNumber': instance.certificationNumber,
      'timeType': _$PartTimeEnumMap[instance.partTime]!,
    };

const _$PartTimeEnumMap = {
  PartTime.partA: 'PART_A',
  PartTime.partB: 'PART_B',
  PartTime.partC: 'PART_C',
};
