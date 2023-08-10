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
      role: $enumDecode(_$RoleTypeEnumMap, json['role']),
    );

Map<String, dynamic> _$MemberInfoResponseToJson(MemberInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'role': _$RoleTypeEnumMap[instance.role]!,
    };

const _$RoleTypeEnumMap = {
  RoleType.arrow: 'ROLE_ALLOW',
  RoleType.notAllow: 'ROLE_NOT_ALLOW',
  RoleType.stop: 'ROLE_STOP',
  RoleType.sleeper: 'ROLE_SLEEPER',
  RoleType.admin: 'ROLE_ADMIN',
  RoleType.master: 'ROLE_MASTER',
};
