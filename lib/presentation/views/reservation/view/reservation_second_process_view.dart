import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_part_time_seat_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/second/reservation_second_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/utils/reservation_utils.dart';
import 'package:reservation_app/presentation/views/reservation/widget/adapter/remain_seat_list_adapter.dart';

class ReservationSecondProcessView extends StatefulWidget {
  const ReservationSecondProcessView({Key? key}) : super(key: key);

  @override
  State<ReservationSecondProcessView> createState() =>
      _ReservationSecondProcessViewState();
}

class _ReservationSecondProcessViewState
    extends State<ReservationSecondProcessView> {
  @override
  Widget build(BuildContext context) {
    final reservationBloc = BlocProvider.of<ReservationBloc>(context);
    final reservationSecondBloc = context.read<ReservationSecondBloc>()
      ..add(ReservationSecondEventGetSeatList(
        partTime: reservationBloc.state.selectedTime,
        date: reservationBloc.state.dateTime,
        count: reservationBloc.state.selectedCount,
        maxUserCount: reservationBloc.state.realUserCount,
      ));

    void onReservationClick(
        {required List<ReservationTargetPartTimeSeatModel> seatList}) {
      if (reservationBloc.state.selectedCount > 0) {
        reservationBloc.add(
          ReservationSelectedSeatsEvent(
            selectedSeatList: ReservationUtils.modelToSeatTypeList(
              selectedSeatList: seatList,
            ),
          ),
        );
      } else if (reservationBloc.state.selectedCount == 0) {
        final selectedList = seatList
            .where(
              (item) => item.isSelected,
            )
            .toList();

        if (selectedList.isEmpty) {
          DialogUtils.showBasicDialog(
            context: context,
            title: "알림",
            message: "좌석을 선택해주세요!",
          );
          return;
        }

        reservationBloc.add(
          ReservationSelectedSeatsEvent(
            selectedSeatList: ReservationUtils.modelToSeatTypeList(
              selectedSeatList: selectedList,
            ),
          ),
        );
      }
    }

    return Expanded(
      child: BlocConsumer<ReservationSecondBloc, ReservationSecondState>(
        bloc: reservationSecondBloc,
        listenWhen: (previous, current) {
          return true;
        },
        listener: (context, state) {
          if (state is ReservationSecondStateSeatList) {
            if (reservationBloc.state.selectedCount == 0) {
              final selectedList = state.seatLists
                  .where(
                    (item) => item.isSelected,
                  )
                  .toList();

              if (selectedList.isEmpty) {
                reservationBloc.add(
                  ReservationSelectedSeatsEvent(
                    selectedSeatList: [],
                  ),
                );
              }
            }
          }
        },
        buildWhen: (previous, current) {
          return true;
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ReservationSecondStateLoading:
              return const NetworkLoadingWidget();

            case ReservationSecondStateFailed:
              final errorMessage =
                  (state as ReservationSecondStateFailed).message;
              return NetworkErrorWidget(
                errorMessage: errorMessage,
              );

            case ReservationSecondStateNoSelectedDateTime:
              return const SizedBox();

            case ReservationSecondStateSeatList:
              final List<ReservationTargetPartTimeSeatModel> seatList =
                  (state as ReservationSecondStateSeatList).seatLists;

              return Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  left: 20.0,
                  right: 20.0,
                  bottom: 20.0,
                ),
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        bottom: 15,
                        left: 20,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: seatList.isEmpty
                              ? ColorsConstants.primary
                              : ColorsConstants
                                  .calendarPickerColor, // 테두리 색상 설정
                          width: 2.0, // 테두리 너비 설정
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Lottie.asset(
                              seatList.isEmpty
                                  ? 'assets/lottie/error-animation.json'
                                  : 'assets/lottie/success_animation.json',
                              animate: true,
                              width: 100,
                              height: 100,
                              repeat: false,
                            ),
                            Text(
                              "선택하신 날짜",
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsConstants.divider,
                              ),
                            ),
                            Text(
                              "${DateTimeUtils.dateTimeToString(
                                pattern: "yyyy년 MM월 dd일",
                                date: reservationBloc.state.dateTime!,
                              )} ${DateTimeUtils.dateTimeToWeekDay(
                                date: reservationBloc.state.dateTime!,
                              )}",
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorsConstants.strokeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ReservationUtils.partTimeToString(
                                    partTime:
                                        reservationBloc.state.selectedTime,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorsConstants.strokeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "시에",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: ColorsConstants.divider,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ReservationUtils.reservationCountToString(
                                    count: reservationBloc.state.selectedCount,
                                    realUserCount:
                                        reservationBloc.state.realUserCount,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorsConstants.strokeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  seatList.isEmpty ? "은" : "으로",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: ColorsConstants.divider,
                                  ),
                                ),
                              ],
                            ),
                            seatList.isEmpty
                                ? Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '이미 예약이 ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: ColorsConstants.divider,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '꽉 찼어요ㅠ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: ColorsConstants.primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '다른 날짜',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color:
                                                    ColorsConstants.strokeColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '로 ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: ColorsConstants.divider,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '변경',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color:
                                                    ColorsConstants.strokeColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '해주세요..!',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: ColorsConstants.divider,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '예약',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: ColorsConstants.divider,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '이 ',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: ColorsConstants.divider,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '가능',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: ColorsConstants.divider,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '합니다!',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: ColorsConstants.divider,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            seatList.isEmpty
                                ? Container(
                                    constraints:
                                        BoxConstraints.expand(height: 10),
                                  )
                                : Container(
                                    constraints: BoxConstraints.expand(
                                      height:
                                          reservationBloc.state.selectedCount ==
                                                  0
                                              ? 10
                                              : 30.0,
                                    ),
                                  ),
                            if (seatList.isNotEmpty)
                              Visibility(
                                visible:
                                    reservationBloc.state.selectedCount == 0 &&
                                        reservationBloc.state.realUserCount < 4,
                                child: RemainSeatListAdapter(
                                  seatList: seatList,
                                  onSelectedSeat: ({
                                    required int selectedItem,
                                  }) {
                                    reservationSecondBloc.add(
                                      ReservationSecondEventSelectedSeats(
                                        currentItem: selectedItem,
                                        selectedLimitUserCount:
                                            reservationBloc.state.realUserCount,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            Container(
                              constraints: BoxConstraints.expand(
                                height: reservationBloc.state.selectedCount == 0
                                    ? 10
                                    : 0,
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: ColorsConstants.calendarPickerColor,
                            ),
                            Container(
                              constraints: const BoxConstraints.expand(
                                height: 10.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (seatList.isNotEmpty)
                                  ElevatedButton(
                                    onPressed: () {
                                      onReservationClick(
                                        seatList: seatList,
                                      );
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            50.0,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        ColorsConstants.strokeColor,
                                      ),
                                    ),
                                    child: Text(
                                      "해당 날짜로 예약",
                                      style: TextStyle(
                                        color: ColorsConstants.background,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                if (seatList.isNotEmpty) SizedBox(width: 30),
                                ElevatedButton(
                                  onPressed: () {
                                    reservationBloc.add(
                                      ReservationProcessEvent(
                                        processIndex: (reservationBloc
                                                    .state.currentPosition -
                                                1) %
                                            Constants
                                                .reservationProcessList.length,
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          50.0,
                                        ),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      ColorsConstants.primary,
                                    ),
                                  ),
                                  child: Text(
                                    "예약 정보 변경",
                                    style: TextStyle(
                                      color: ColorsConstants.background,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    seatList.isEmpty
                        ? SizedBox()
                        : Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 20,
                              bottom: 20,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              color: ColorsConstants.guideBackground,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 7, top: 7),
                                      width: 2,
                                      height: 2,
                                      color: ColorsConstants.guideText,
                                    ),
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '입력하신 예약 정보가 맞다면',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' 해당 날짜로 예약 ',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '버튼을 눌러주세요.',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  constraints:
                                      const BoxConstraints.expand(height: 5),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 7),
                                      width: 2,
                                      height: 2,
                                      color: ColorsConstants.guideText,
                                    ),
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '예약 정보를 변경 하시려면',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' 예약 정보 변경 ',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '버튼을 눌러주세요.',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  constraints:
                                      const BoxConstraints.expand(height: 5),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 7),
                                      width: 2,
                                      height: 2,
                                      color: ColorsConstants.guideText,
                                    ),
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '1인석 ',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '자리를 선택하신 경우',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' 죄석 선택',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '이 가능합니다.',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  constraints:
                                      const BoxConstraints.expand(height: 5),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 7, top: 7),
                                      width: 2,
                                      height: 2,
                                      color: ColorsConstants.guideText,
                                    ),
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '4인석, 6인석 ',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '자리를 선택하신 경우',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' 별도의 룸',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '으로 되어있어 좌석 선택을 하실 필요가 없습니다.',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    ColorsConstants.guideText,
                                                letterSpacing: -0.02,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              );

            default:
              return const NetworkErrorWidget(
                errorMessage: Constants.networkError,
              );
          }
        },
      ),
    );
  }
}
