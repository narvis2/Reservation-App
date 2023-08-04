
import 'package:equatable/equatable.dart';

class SignInRequestModel extends Equatable {
  final String email;
  final String password;

  SignInRequestModel({required this.email, required this.password, });

  @override
  List<Object?> get props => [email, password,];

  @override
  bool? get stringify => true;
}