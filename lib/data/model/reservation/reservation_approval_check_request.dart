

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_approval_check_request.g.dart';

@JsonSerializable()
class ReservationApprovalCheckRequest extends Equatable {
  final bool isApproved;

  const ReservationApprovalCheckRequest({required this.isApproved});

  factory ReservationApprovalCheckRequest.fromJson(Map<String, dynamic> json) =>
      _$ReservationApprovalCheckRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationApprovalCheckRequestToJson(this);

  @override
  List<Object?> get props => [isApproved];

  @override
  bool? get stringify => false;
}