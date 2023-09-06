import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reservation_app/domain/model/reservation/reservation_range_section_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/bloc/reservation_calendar_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/utils/calendar_utils.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/widget/calendar_detail_item_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/widget/calendar_empty_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/widget/calendar_summary_list_widget.dart';
import 'package:reservation_app/presentation/views/reservation/utils/reservation_utils.dart';
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
  late final RefreshController _refreshController;

  ValueNotifier<List<ReservationRangeSectionModel>> _selectedEvents =
      ValueNotifier([]);

  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  bool _isDetailShow = false;

  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _reservationCalendarTabBloc = BlocProvider.of<ReservationCalendarTabBloc>(
      context,
    );
    _refreshController = RefreshController(initialRefresh: false);

    _selectedDay = _focusedDay;

    // 데이터 호출
    _reservationCalendarTabBloc.add(ReservationCalendarTabInitDataEvent());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
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

      final selectedDateList = _selectedEvents.value.where(
        (element) =>
            element.sectionTitle ==
            DateTimeUtils.dateTimeToYearDateString(selectedDay),
      );

      if (selectedDateList.isNotEmpty) {
        _reservationCalendarTabBloc.add(
          ReservationCalendarTabTargetListEvent(
            targetDate: selectedDay,
          ),
        );
      } else {
        _reservationCalendarTabBloc.add(
          ReservationCalendarTabResetTargetListEvent(),
        );
      }
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
      _isDetailShow = true;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end, sectionList);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start, sectionList);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end, sectionList);
    }

    _reservationCalendarTabBloc.add(
      ReservationCalendarTabResetTargetListEvent(),
    );
  }

  void _popBackStack() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  void _toggleIsShowDetail() {
    setState(() {
      _isDetailShow = !_isDetailShow;
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      _focusedDay = DateTime.now();
      _selectedDay = _focusedDay;
      _rangeStart = null;
      _rangeEnd = null;
      _calendarFormat = CalendarFormat.month;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
      _isDetailShow = false;
    });
    _reservationCalendarTabBloc.add(ReservationCalendarTabInitDataEvent());
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationCalendarTabBloc,
        ReservationCalendarTabState>(
      bloc: _reservationCalendarTabBloc,
      listenWhen: (previous, current) {
        return previous != current &&
            (previous.sectionListStatus != current.sectionListStatus ||
                previous.targetListStatus != current.targetListStatus);
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
        return Scaffold(
          body: SmartRefresher(
            controller: _refreshController,
            physics: ClampingScrollPhysics(),
            onRefresh: _onRefresh,
            enablePullDown: true,
            enablePullUp: false,
            header: WaterDropHeader(
              completeDuration: Duration(milliseconds: 1000),
              refresh: NetworkLoadingWidget(),
              complete: Lottie.asset(
                'assets/lottie/success_animation.json',
                animate: true,
                width: 100,
                height: 100,
                repeat: false,
              ),
            ),
            child: Column(
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
                      if (isSameDay(
                        DateTime.parse(section.sectionTitle),
                        date,
                      )) {
                        events.add(section);
                      }
                    }

                    return events;
                  },
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day,
                        List<ReservationRangeSectionModel> events) {
                      if (events.isEmpty) return SizedBox();

                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          final item = events[index];

                          return Container(
                            margin: const EdgeInsets.only(top: 35),
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorsConstants.getParTimeColor(
                                  item.partTime,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "${events[index].list.length}",
                                  style: TextStyle(
                                    color: ColorsConstants.background,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
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
                      color: ColorsConstants.currentDate,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: const TextStyle(
                      color: ColorsConstants.background,
                      fontSize: 16.0,
                    ),
                    selectedDecoration: const BoxDecoration(
                      color: ColorsConstants.selectedDate,
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
                      SnackBarUtils.showCustomSnackBar(
                        context,
                        "매주 화요일은 휴무입니다.",
                      );
                      return;
                    }

                    _onDaySelected(selectedDay, focusedDay, state.sectionList);
                  },
                  onRangeSelected: (start, end, focusedDay) {
                    // 범위 날짜가 선택되었을 때 호출되는 콜백 함수
                    debugPrint("⭐️ onRangeSelected start 👉 $start");
                    debugPrint("⭐️ onRangeSelected end 👉 $end");
                    debugPrint("⭐️ onRangeSelected focusedDay 👉 $focusedDay");
                    _onRangeSelected(start, end, focusedDay, state.sectionList);
                  },
                  // 달력 형식 변경 시 호출되는 콜백 함수
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
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 10.0,
                  color: ColorsConstants.settingDivider,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorsConstants.thinDivider,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (_isDetailShow) {
                            if (_rangeSelectionMode ==
                                RangeSelectionMode.toggledOn) {
                              SnackBarUtils.showCustomSnackBar(
                                context,
                                "범위 선택중에는 요약보기를 사용할 수 없습니다.",
                              );
                              return;
                            }

                            _toggleIsShowDetail();
                          }
                        },
                        child: Text(
                          "요약 보기",
                          style: TextStyle(
                            fontSize: 14,
                            color: !_isDetailShow
                                ? ColorsConstants.boldColor
                                : ColorsConstants.textHint,
                            fontWeight: !_isDetailShow
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(color: ColorsConstants.divider),
                      ),
                      TextButton(
                        onPressed: () {
                          if (!_isDetailShow) {
                            _toggleIsShowDetail();
                          }
                        },
                        child: Text(
                          "상세 보기",
                          style: TextStyle(
                            fontSize: 14,
                            color: _isDetailShow
                                ? ColorsConstants.boldColor
                                : ColorsConstants.textHint,
                            fontWeight: _isDetailShow
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: _isDetailShow
                        ? ValueListenableBuilder<
                            List<ReservationRangeSectionModel>>(
                            valueListenable: _selectedEvents,
                            builder: (context, value, _) {
                              if (value.isEmpty) {
                                return CalendarEmptyWidget(
                                    message: "예약이 없습니다.");
                              }

                              return GroupedListView<
                                  ReservationRangeSectionModel, String>(
                                elements: value,
                                groupBy: (element) =>
                                    "${DateTimeUtils.dateTimeToString(pattern: "yy-MM-dd", date: DateTime.parse(element.sectionTitle))} ${ReservationUtils.partTimeToString(partTime: element.partTime.index)}",
                                groupSeparatorBuilder: (groupByValue) =>
                                    Container(
                                  margin: EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    top: 10,
                                  ),
                                  child: Text(
                                    groupByValue,
                                    style: TextStyle(
                                      color: ColorsConstants.strokeColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                indexedItemBuilder: (context, element, index) {
                                  return CalendarDetailItemWidget(
                                    item: element,
                                  );
                                },
                              );
                            },
                          )
                        : CalendarSummaryListWidget(
                            selectedDate: _selectedDay ?? DateTime.now(),
                          )),
              ],
            ),
          ),
        );
      },
    );
  }
}
