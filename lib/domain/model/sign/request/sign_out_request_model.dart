
import 'package:equatable/equatable.dart';

class SignOutRequestModel extends Equatable {
  final int memberId;
  const SignOutRequestModel({
    required this.memberId,
  });

  @override
  List<Object?> get props => [memberId];

  @override
  bool? get stringify => false;
}