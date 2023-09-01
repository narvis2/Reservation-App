import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
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
  late final ValueNotifier<List<Event>> _selectedEvents;

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
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));

    _reservationCalendarTabBloc.add(ReservationCalendarTabInitDataEvent());
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationCalendarTabBloc,
        ReservationCalendarTabState>(
      bloc: _reservationCalendarTabBloc,
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {},
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
              eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                // Use `CalendarStyle` to customize the UI
                outsideDaysVisible: false,
                canMarkersOverflow: false,
                markerMargin: const EdgeInsets.symmetric(horizontal: 0.3),
                markerDecoration: const BoxDecoration(
                  color: ColorsConstants.strokeColor,
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
              onDaySelected: _onDaySelected,
              onRangeSelected: _onRangeSelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
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
              child: ValueListenableBuilder<List<Event>>(
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
