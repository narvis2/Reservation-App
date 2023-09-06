part of 'reservation_calendar_tab_bloc.dart';

enum SectionListStatus {
  initial,
  loading,
  success,
  error,
}

enum TargetListStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class ReservationCalendarTabState with _$ReservationCalendarTabState {
  const factory ReservationCalendarTabState({
    @Default(SectionListStatus.initial) SectionListStatus sectionListStatus,
    @Default(TargetListStatus.initial) TargetListStatus targetListStatus,
    @Default([]) List<ReservationRangeSectionModel> sectionList,
    @Default([]) List<ReservationTargetDateModel> targetList,
    @Default(null) String? sectionListErrorMsg,
    @Default(null) String? targetListErrorMsg,
  }) = Initial;
}
