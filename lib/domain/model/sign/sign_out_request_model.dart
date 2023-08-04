
import 'package:equatable/equatable.dart';

class SignOutRequestModel extends Equatable {
  final String accessToken;

  SignOutRequestModel({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}