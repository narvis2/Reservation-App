import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:reservation_app/di/dependency_inection_graph.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/home/bloc/content_home_tab_bloc.dart';

import '../../../../../../../domain/model/reservation/reservation_target_date_model.dart';

class ContentHomeTabScreen extends StatefulWidget {
  const ContentHomeTabScreen({Key? key}) : super(key: key);

  @override
  State<ContentHomeTabScreen> createState() => _ContentHomeTabScreenState();
}

class _ContentHomeTabScreenState extends State<ContentHomeTabScreen>
    with TickerProviderStateMixin {
  late final ContentHomeTabBloc contentHomeTabBloc;
  final String timeString = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    contentHomeTabBloc = locator.get<ContentHomeTabBloc>()
      ..add(
        ContentHomeTabTargetReservation(),
      );
  }

  @override
  void dispose() {
    contentHomeTabBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      color: ColorsConstants.background,
      child: BlocBuilder<ContentHomeTabBloc, ContentHomeTabState>(
        bloc: contentHomeTabBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case ContentHomeTabStateLoading:
              return const NetworkLoadingWidget();

            case ContentHomeTabStateTargetReservationFailed:
              final errorMessage =
                  (state as ContentHomeTabStateTargetReservationFailed).message;
              return NetworkErrorWidget(
                errorMessage: errorMessage,
              );

            case ContentHomeTabStateTargetReservation:
              final List<ReservationTargetDateModel> todayReservationList =
                  (state as ContentHomeTabStateTargetReservation)
                      .targetReservationList;

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
                          constraints:
                              const BoxConstraints.expand(height: 10.0),
                        ),
                        Row(
                          children: [
                            Icon(Icons.date_range_outlined),
                            SizedBox(width: 5),
                            Text(
                              "오늘의 예약($timeString)",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorsConstants.divider,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          constraints:
                              const BoxConstraints.expand(height: 5.0),
                        ),
                        Expanded(
                          child: GroupedListView<ReservationTargetDateModel,
                              String>(
                            elements: todayReservationList,
                            padding: EdgeInsets.only(left: 10),
                            groupBy: (reservation) => reservation.partTime,
                            groupSeparatorBuilder: (groupByValue) => Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                groupByValue == "PART_A"
                                    ? "PM 1:00 남은 좌석"
                                    : groupByValue == "PART_B"
                                        ? "PM 5:50 남은 좌석"
                                        : groupByValue == "PART_C"
                                            ? "PM 8:00 남은 좌석"
                                            : groupByValue,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: ColorsConstants.divider,
                                ),
                              ),
                            ),
                            indexedItemBuilder: (context, reservation, index) {
                              return Column(
                                children: reservation.remainsSeatList.map((item) => Padding(
                                  padding: EdgeInsets.only(left: 8, top: 5, bottom: 5),
                                  child: Row(
                                    children: [
                                      Text("└─ ${item.seatCategory}", style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: ColorsConstants.divider,
                                      )),
                                      Text(" : ", style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: ColorsConstants.divider,
                                      )),
                                      Text('${item.seatCount}', style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: ColorsConstants.divider,
                                      )),
                                    ],
                                  ),
                                )).toList(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );

            default:
              return const NetworkErrorWidget(
                errorMessage: '네트워크가 원활하지 않습니다. \n 잠시 후 다시 시도해주세요.',
              );
          }
        },
      ),
    );
  }
}
