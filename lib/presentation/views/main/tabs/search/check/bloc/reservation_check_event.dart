part of 'reservation_check_bloc.dart';

@freezed
class ReservationCheckEvent with _$ReservationCheckEvent {
  const factory ReservationCheckEvent.init() = ReservationCheckInitEvent;

  const factory ReservationCheckEvent.filterList({
    required int page,
    required int limit,
    required ReservationFilterType filterType,
  }) = ReservationCheckFilterListEvent;

  const factory ReservationCheckEvent.loadNextData() = ReservationCheckLoadNextDataEvent;
}
