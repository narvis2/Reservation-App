import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phone_auth_request.g.dart';

@JsonSerializable()
class PhoneAuthRequest extends Equatable {
  final String name;
  final String phoneNumber;

  const PhoneAuthRequest({
    required this.name,
    required this.phoneNumber,
  });

  factory PhoneAuthRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneAuthRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneAuthRequestToJson(this);

  PhoneAuthRequest copyWith({
    String? name,
    String? phoneNumber,
  }) {
    return PhoneAuthRequest(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [
        name,
        phoneNumber,
      ];

  @override
  bool? get stringify => false;
}
