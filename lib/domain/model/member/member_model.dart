import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class MemberModel extends Equatable {
  final int id;
  final String email;
  final String name;
  final String phoneNumber;
  final String role;
  final bool isEnablePush;

  MemberModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.role,
    required this.isEnablePush,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$MemberModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        email,
        role,
        phoneNumber,
        name,
        isEnablePush,
      ];
}
