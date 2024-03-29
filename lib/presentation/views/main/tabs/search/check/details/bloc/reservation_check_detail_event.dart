part of 'reservation_check_detail_bloc.dart';

@freezed
class ReservationCheckDetailEvent with _$ReservationCheckDetailEvent {
  const factory ReservationCheckDetailEvent.requestDetails({
    required int id,
  }) = ReservationRequestCheckDetailEvent;

  const factory ReservationCheckDetailEvent.requestDetailsByUser({
    required String certificationNumber,
  }) = ReservationRequestCheckDetailByUserEvent;

  const factory ReservationCheckDetailEvent.requestInit({
    int? id,
    String? certificationNumber,
  }) = ReservationRequestCheckDetailInitDataEvent;

  const factory ReservationCheckDetailEvent.requestCheck({
    required int id,
    required bool isApproval,
  }) = ReservationCheckDetailCheckEvent;
}
