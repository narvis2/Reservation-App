import 'package:json_annotation/json_annotation.dart';

enum ReservationFilterType {
  @JsonValue('ALL')
  all,
  @JsonValue('NON_AUTH')
  nonAuth,
  @JsonValue('AUTH')
  auth,
}

extension ReservationFilterTypeExtension on ReservationFilterType {
  String toJson() {
    switch (this) {
      case ReservationFilterType.all:
        return 'ALL';
      case ReservationFilterType.auth:
        return 'AUTH';
      case ReservationFilterType.nonAuth:
        return 'NON_AUTH';
      default:
        throw ArgumentError('Invalid enum value: $this');
    }
  }
}
