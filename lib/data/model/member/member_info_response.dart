import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservation_app/data/model/role/role_type.dart';

part 'member_info_response.g.dart';

@JsonSerializable()
class MemberInfoResponse extends Equatable {
  final int id;
  final String email;
  final String phoneNumber;
  final RoleType role;

  MemberInfoResponse({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory MemberInfoResponse.fromJson(Map<String, dynamic> json) => _$MemberInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MemberInfoResponseToJson(this);

  @override
  List<Object?> get props => [
        id,
        email,
        phoneNumber,
        role,
      ];
}
