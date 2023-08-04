// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberInfoResponse _$MemberInfoResponseFromJson(Map<String, dynamic> json) =>
    MemberInfoResponse(
      id: json['id'] as int,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      roleType: $enumDecode(_$RoleTypeEnumMap, json['roleType']),
    );

Map<String, dynamic> _$MemberInfoResponseToJson(MemberInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'roleType': _$RoleTypeEnumMap[instance.roleType]!,
    };

const _$RoleTypeEnumMap = {
  RoleType.arrow: 'ROLE_ALLOW',
  RoleType.notAllow: 'ROLE_ALLOW',
  RoleType.stop: 'ROLE_STOP',
  RoleType.sleeper: 'ROLE_SLEEPER',
  RoleType.admin: 'ROLE_ADMIN',
  RoleType.master: 'ROLE_MASTER',
};
