part of 'reservation_calendar_tab_bloc.dart';

enum SectionListStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class ReservationCalendarTabState with _$ReservationCalendarTabState {
  const factory ReservationCalendarTabState({
    @Default(SectionListStatus.initial) SectionListStatus sectionListStatus,
    @Default([]) List<ReservationRangeSectionModel> sectionList,
    @Default(null) String? sectionListErrorMsg,
  }) = Initial;
}
