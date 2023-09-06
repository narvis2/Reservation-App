// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_range_section_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReservationRangeSectionResponse _$$_ReservationRangeSectionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ReservationRangeSectionResponse(
      sectionTitle: json['sectionTitle'] as String,
      partTime: $enumDecode(_$PartTimeEnumMap, json['timeType']),
      list: (json['list'] as List<dynamic>)
          .map((e) => ReservationRangeSectionDataResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReservationRangeSectionResponseToJson(
        _$_ReservationRangeSectionResponse instance) =>
    <String, dynamic>{
      'sectionTitle': instance.sectionTitle,
      'timeType': _$PartTimeEnumMap[instance.partTime]!,
      'list': instance.list,
    };

const _$PartTimeEnumMap = {
  PartTime.partA: 'PART_A',
  PartTime.partB: 'PART_B',
  PartTime.partC: 'PART_C',
};
