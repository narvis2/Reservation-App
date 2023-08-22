part of 'reservation_check_bloc.dart';

@freezed
class ReservationCheckEvent with _$ReservationCheckEvent {
  const factory ReservationCheckEvent.init() = ReservationCheckInitEvent;

  const factory ReservationCheckEvent.filterList({
    required int page,
    required ReservationFilterType filterType,
  }) = ReservationCheckFilterListEvent;

  const factory ReservationCheckEvent.loadNextData() = ReservationCheckLoadNextDataEvent;

  const factory ReservationCheckEvent.changeFilter({
    required ReservationFilterType filterType,
  }) = ReservationCheckChangeFilterEvent;

  const factory ReservationCheckEvent.refreshList() = ReservationCheckRefreshEvent;
}
