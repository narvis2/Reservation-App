
import 'package:equatable/equatable.dart';

class SignInResponseModel extends Equatable {
  final String token;
  final String refreshToken;

  SignInResponseModel({
    required this.token,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [token, refreshToken];
}