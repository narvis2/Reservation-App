// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberInfoResponse _$MemberInfoResponseFromJson(Map<String, dynamic> json) =>
    MemberInfoResponse(
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      role: $enumDecode(_$RoleTypeEnumMap, json['role']),
      isEnablePush: json['isEnablePush'] as bool,
    );

Map<String, dynamic> _$MemberInfoResponseToJson(MemberInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'role': _$RoleTypeEnumMap[instance.role]!,
      'isEnablePush': instance.isEnablePush,
    };

const _$RoleTypeEnumMap = {
  RoleType.arrow: 'ROLE_ALLOW',
  RoleType.notAllow: 'ROLE_NOT_ALLOW',
  RoleType.stop: 'ROLE_STOP',
  RoleType.sleeper: 'ROLE_SLEEPER',
  RoleType.admin: 'ROLE_ADMIN',
  RoleType.master: 'ROLE_MASTER',
};
