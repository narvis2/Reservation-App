import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_date_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/bloc/reservation_calendar_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/widget/calendar_empty_widget.dart';

class CalendarSummaryListWidget extends StatefulWidget {
  final DateTime selectedDate;
  const CalendarSummaryListWidget({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);

  @override
  State<CalendarSummaryListWidget> createState() =>
      _CalendarSummaryListWidgetState();
}

class _CalendarSummaryListWidgetState extends State<CalendarSummaryListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCalendarTabBloc, ReservationCalendarTabState>(
        builder: (context, state) {
      if (state.targetListStatus == TargetListStatus.loading) {
        return NetworkLoadingWidget();
      } else if (state.targetListStatus == TargetListStatus.error) {
        return NetworkErrorWidget(
          errorMessage: state.targetListErrorMsg ?? Constants.networkError,
        );
      } else if (state.targetListStatus == TargetListStatus.success) {
        if (state.targetList.isEmpty) {
          return CalendarEmptyWidget(message: "예약이 없습니다.");
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints.expand(height: 10.0),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.date_range_outlined),
                      SizedBox(width: 5),
                      Text(
                        "${DateTimeUtils.dateTimeToYearDateString(
                          widget.selectedDate,
                        )} 예약 정보",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorsConstants.divider,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    constraints: const BoxConstraints.expand(height: 5.0),
                  ),
                  Expanded(
                    child: GroupedListView<ReservationTargetDateModel, String>(
                      elements: state.targetList,
                      padding: EdgeInsets.only(left: 15),
                      groupBy: (reservation) => reservation.partTime,
                      groupSeparatorBuilder: (groupByValue) => Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(1),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: groupByValue == "PART_A"
                                      ? ColorsConstants.partTimeA
                                      : groupByValue == "PART_B"
                                      ? ColorsConstants.partTimeB
                                      : groupByValue == "PART_C"
                                      ? ColorsConstants.partTimeC
                                      : ColorsConstants.divider,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              groupByValue == "PART_A"
                                  ? "PM 1:00 남은 좌석"
                                  : groupByValue == "PART_B"
                                      ? "PM 5:50 남은 좌석"
                                      : groupByValue == "PART_C"
                                          ? "PM 8:00 남은 좌석"
                                          : groupByValue,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: ColorsConstants.divider,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      indexedItemBuilder: (context, reservation, index) {
                        return Column(
                          children: reservation.remainsSeatList.map((item) {
                            final isSoldOut = item.seatCount == 0;

                            return Padding(
                              padding:
                                  EdgeInsets.only(left: 8, top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    "└─ ${item.seatCategory}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: isSoldOut
                                          ? ColorsConstants.primary
                                          : ColorsConstants.divider,
                                    ),
                                  ),
                                  Text(
                                    " : ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: isSoldOut
                                          ? ColorsConstants.primary
                                          : ColorsConstants.divider,
                                    ),
                                  ),
                                  Text(
                                    '${isSoldOut ? '- 매진 -' : item.seatCount}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: isSoldOut
                                          ? ColorsConstants.primary
                                          : ColorsConstants.divider,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      } else {
        return SizedBox.shrink();
      }
    });
  }
}
