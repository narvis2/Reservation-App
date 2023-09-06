
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse extends Equatable {
  final String token;
  final String refreshToken;

  SignInResponse({
    required this.token,
    required this.refreshToken,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);

  @override
  List<Object?> get props => [token, refreshToken];
}