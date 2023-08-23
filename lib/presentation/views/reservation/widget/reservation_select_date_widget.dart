import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';

// 날짜 선택 Widget
class ReservationSelectDateWidget extends StatefulWidget {
  const ReservationSelectDateWidget({Key? key}) : super(key: key);

  @override
  State<ReservationSelectDateWidget> createState() =>
      _ReservationSelectDateWidgetState();
}

class _ReservationSelectDateWidgetState
    extends State<ReservationSelectDateWidget> {
  late final ReservationBloc _reservationBloc;

  @override
  void initState() {
    super.initState();
    _reservationBloc = BlocProvider.of<ReservationBloc>(context);
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return "날짜 선택";

    return DateTimeUtils.dateTimeToString(
      pattern: "yyyy-MM-dd",
      date: dateTime,
    );
  }

  bool _isValidDate(DateTime dateTime) {
    return DateTimeUtils.isDateWithinOneHour(
      DateTimeUtils.dateTimeWithPartTime(
        dateTime,
        PartTime.partC,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "예약 날짜",
          style: TextStyle(
            color: ColorsConstants.divider,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        BlocSelector<ReservationBloc, ReservationState, DateTime?>(
          bloc: _reservationBloc,
          selector: (state) {
            return state.dateTime;
          },
          builder: (context, state) {
            return OutlinedButton(
              onPressed: () async {
                DateTime? newDateTime = await DialogUtils.showDatePickerDialog(
                  context: context,
                  initDate: _isValidDate(DateTime.now())
                      ? state ?? DateTime.now()
                      : DateTime.now().add(Duration(days: 1)),
                  onTabDay: (
                    // 확인 버튼 누르지않고 아무 날짜나 선택했을 때 Callback
                    DateTime dateTime,
                    bool available,
                  ) {
                    final now = DateTime.now();

                    if (dateTime.weekday == 2) {
                      SnackBarUtils.showCustomSnackBar(
                        context,
                        "매주 화요일은 휴무입니다.",
                      );

                      return false;
                    }

                    // 같은 날짜 선택했을 때 Callback
                    if ((dateTime.year == now.year &&
                        dateTime.month == now.month &&
                        dateTime.day == now.day)) {

                      if (!_isValidDate(dateTime)) {
                        SnackBarUtils.showCustomSnackBar(
                          context,
                          "예약 시간이 지났어요!",
                        );
                        return false;
                      }

                      return true;
                    }

                    // 이전 날짜 클릭했을 때 Callback
                    if (dateTime.isBefore(now)) {
                      return false;
                    }

                    return available;
                  },
                ).then((value) {
                  // 확인 버튼 눌렀을 경우 Callback
                  if (value != null) {
                    _reservationBloc.add(
                      ReservationDatePickerEvent(
                        selectedDateTime: value,
                      ),
                    );
                  }

                  return value;
                });
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: state == null
                        ? ColorsConstants.splashText
                        : ColorsConstants.inProgressColor,
                  ),
                ), // 테두리 선 색상
                foregroundColor: MaterialStateProperty.all(
                  state == null
                      ? ColorsConstants.primaryButtonText
                      : ColorsConstants.calendarPickerColor,
                ), // 텍스트 색상
              ),
              child: Text(
                _formatDateTime(state),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: state == null ? FontWeight.w600 : FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
