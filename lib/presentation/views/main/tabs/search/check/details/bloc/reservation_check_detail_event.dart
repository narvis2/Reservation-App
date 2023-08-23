part of 'reservation_check_detail_bloc.dart';

@freezed
class ReservationCheckDetailEvent with _$ReservationCheckDetailEvent {
  const factory ReservationCheckDetailEvent.requestDetails({
    required int id,
  }) = ReservationRequestCheckDetailEvent;

  const factory ReservationCheckDetailEvent.requestDetailsByUser({
    required String certificationNumber,
  }) = ReservationRequestCheckDetailByUserEvent;
}
