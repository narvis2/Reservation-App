import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_out_request.g.dart';

@JsonSerializable()
class SignOutRequest extends Equatable {
  final int memberId;

  SignOutRequest({
    required this.memberId,
  });

  factory SignOutRequest.fromJson(Map<String, dynamic> json) =>
    _$SignOutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignOutRequestToJson(this);

  @override
  List<Object?> get props => [memberId];

  @override
  bool? get stringify => false;
}