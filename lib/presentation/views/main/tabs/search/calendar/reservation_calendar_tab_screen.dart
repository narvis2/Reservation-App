import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/reservation/reservation_range_section_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/bloc/reservation_calendar_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/utils/calendar_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationCalendarTabScreen extends StatefulWidget {
  const ReservationCalendarTabScreen({Key? key}) : super(key: key);

  @override
  State<ReservationCalendarTabScreen> createState() =>
      _ReservationCalendarTabScreenState();
}

class _ReservationCalendarTabScreenState
    extends State<ReservationCalendarTabScreen> {
  late final ReservationCalendarTabBloc _reservationCalendarTabBloc;
  ValueNotifier<List<ReservationRangeSectionModel>> _selectedEvents =
      ValueNotifier([]);

  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _reservationCalendarTabBloc = BlocProvider.of<ReservationCalendarTabBloc>(
      context,
    );
    _selectedDay = _focusedDay;

    // 데이터 호출
    _reservationCalendarTabBloc.add(ReservationCalendarTabInitDataEvent());
  }

  List<ReservationRangeSectionModel> _getEventsForDay(
    DateTime day,
    List<ReservationRangeSectionModel> sectionList,
  ) {
    final events = <ReservationRangeSectionModel>[];

    for (final section in sectionList) {
      if (isSameDay(DateTime.parse(section.sectionTitle), day)) {
        events.add(section);
      }
    }

    return events;
  }

  List<ReservationRangeSectionModel> _getEventsForRange(
    DateTime start,
    DateTime end,
    List<ReservationRangeSectionModel> sectionList,
  ) {
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d, sectionList),
    ];
  }

  void _onDaySelected(
    DateTime selectedDay,
    DateTime focusedDay,
    List<ReservationRangeSectionModel> sectionList,
  ) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay, sectionList);
    }
  }

  void _onRangeSelected(
    DateTime? start,
    DateTime? end,
    DateTime focusedDay,
    List<ReservationRangeSectionModel> sectionList,
  ) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end, sectionList);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start, sectionList);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end, sectionList);
    }
  }

  void _popBackStack() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationCalendarTabBloc,
        ReservationCalendarTabState>(
      bloc: _reservationCalendarTabBloc,
      listenWhen: (previous, current) {
        return previous != current &&
            previous.sectionListStatus != current.sectionListStatus;
      },
      listener: (context, state) {
        if (state.sectionListStatus == SectionListStatus.loading) {
          DialogUtils.showLoadingDialog(context);
        } else if (state.sectionListStatus == SectionListStatus.success) {
          _selectedEvents = ValueNotifier(
            _getEventsForDay(
              _selectedDay ?? DateTime.now(),
              state.sectionList,
            ),
          );
          _popBackStack();
        } else if (state.sectionListStatus == SectionListStatus.error) {
          _popBackStack();
        }
      },
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return Column(
          children: [
            TableCalendar(
              locale: 'ko_KR',
              firstDay: DateTime(DateTime.now().year),
              lastDay: DateTime(DateTime.now().year + 1),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: _rangeSelectionMode,
              eventLoader: (date) {
                final events = <ReservationRangeSectionModel>[];

                for (final section in state.sectionList) {
                  if (isSameDay(DateTime.parse(section.sectionTitle), date)) {
                    events.add(section);
                  }
                }

                return events;
              },
              startingDayOfWeek: StartingDayOfWeek.monday,
              // 주의 첫 번째 날을 월요일로 설정
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                // 달력에서 현재 월 이외의 날짜 숨김, false 👉 숨김
                canMarkersOverflow: false,
                markerMargin: const EdgeInsets.symmetric(horizontal: 0.3),
                markerDecoration: const BoxDecoration(
                  color: ColorsConstants.primary,
                  shape: BoxShape.circle,
                ),
                rangeHighlightColor: ColorsConstants.calendarSideColor,
                rangeStartTextStyle: const TextStyle(
                  color: ColorsConstants.background,
                  fontSize: 16.0,
                ),
                rangeStartDecoration: const BoxDecoration(
                  color: ColorsConstants.calendarPickerColor,
                  shape: BoxShape.circle,
                ),
                rangeEndTextStyle: const TextStyle(
                  color: ColorsConstants.background,
                  fontSize: 16.0,
                ),
                rangeEndDecoration: const BoxDecoration(
                  color: ColorsConstants.calendarPickerColor,
                  shape: BoxShape.circle,
                ),
                todayTextStyle: const TextStyle(
                  color: ColorsConstants.background,
                  fontSize: 16.0,
                ),
                todayDecoration: const BoxDecoration(
                  color: ColorsConstants.calendarCurrentColor,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: const TextStyle(
                  color: ColorsConstants.background,
                  fontSize: 16.0,
                ),
                selectedDecoration: const BoxDecoration(
                  color: ColorsConstants.calendarRangeColor,
                  shape: BoxShape.circle,
                ),
                holidayTextStyle: const TextStyle(
                  color: ColorsConstants.primary,
                ),
                holidayDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                if (selectedDay.weekday == 2) {
                  SnackBarUtils.showCustomSnackBar(context, "매주 화요일은 휴무입니다.");
                  return;
                }

                _onDaySelected(selectedDay, focusedDay, state.sectionList);
              },
              onRangeSelected: (start, end, focusedDay) {
                // 범위 날짜가 선택되었을 때 호출되는 콜백 함수
                _onRangeSelected(start, end, focusedDay, state.sectionList);
              },
              // 범위가 선택되었을 때 호출되는 콜백 함수
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format; // 달력 형식 변경 시 상태 업데이트
                  });
                }
              },
              // 현재 페이지가 변경될 때 현재 포커스 날짜 업데이트
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                  _reservationCalendarTabBloc.add(
                    ReservationCalendarTabSectionListEvent(
                      startTime: DateTime(
                        focusedDay.year,
                        focusedDay.month,
                        1,
                      ),
                      endTime: DateTime(
                        focusedDay.year,
                        focusedDay.month + 1,
                        1,
                      ),
                    ),
                  );
                });
              },
              holidayPredicate: (day) {
                // 매주 화요일 쉬는 날
                return day.weekday == 2;
              },
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: const TextStyle(
                  fontSize: 20.0,
                  color: ColorsConstants.strokeColor,
                  fontWeight: FontWeight.bold,
                ),
                headerPadding: const EdgeInsets.symmetric(vertical: 4.0),
                leftChevronIcon: const Icon(
                  Icons.arrow_left_rounded,
                  size: 40.0,
                  color: ColorsConstants.strokeColor,
                ),
                rightChevronIcon: const Icon(
                  Icons.arrow_right_rounded,
                  size: 40.0,
                  color: ColorsConstants.strokeColor,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ValueListenableBuilder<List<ReservationRangeSectionModel>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: index == 0 ? 10 : 5,
                          bottom: index == value.length - 1 ? 10 : 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          onTap: () => print('${value[index]}'),
                          title: Text('${value[index]}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
