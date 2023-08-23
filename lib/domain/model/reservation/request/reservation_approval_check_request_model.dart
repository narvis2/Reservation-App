
import 'package:equatable/equatable.dart';

class ReservationApprovalCheckRequestModel extends Equatable {
  final int id;
  final bool isAgree;

  const ReservationApprovalCheckRequestModel({
    required this.id,
    required this.isAgree,
  });

  @override
  List<Object?> get props => [
    id,
    isAgree,
  ];

  @override
  bool? get stringify => false;
}