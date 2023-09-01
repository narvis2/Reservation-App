part of 'reservation_calendar_tab_bloc.dart';

@freezed
class ReservationCalendarTabEvent with _$ReservationCalendarTabEvent {
  const factory ReservationCalendarTabEvent.initData() =
      ReservationCalendarTabInitDataEvent;

  const factory ReservationCalendarTabEvent.sectionList({
    required DateTime startTime,
    required DateTime endTime,
  }) = ReservationCalendarTabSectionListEvent;
}
