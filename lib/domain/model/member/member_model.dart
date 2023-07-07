import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class MemberModel extends Equatable {
  final int id;
  final String email;
  final String role;

  MemberModel({
    required this.id,
    required this.email,
    required this.role,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) => _$MemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$MemberModelToJson(this);

  @override
  List<Object?> get props => [id, email, role];
}
