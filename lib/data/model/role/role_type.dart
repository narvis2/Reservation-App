
import 'package:json_annotation/json_annotation.dart';

enum RoleType {
  @JsonValue('ROLE_ALLOW')
  arrow, // 허용 유저
  @JsonValue('ROLE_ALLOW')
  notAllow, // 비허용 유저
  @JsonValue('ROLE_STOP')
  stop, // 정지
  @JsonValue('ROLE_SLEEPER')
  sleeper, // 휴먼
  @JsonValue('ROLE_ADMIN')
  admin, // 관리자
  @JsonValue('ROLE_MASTER')
  master // 마스터
}