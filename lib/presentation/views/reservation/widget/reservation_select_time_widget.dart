import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';

// 예약 시간 선택 Widget
class ReservationSelectTimeWidget extends StatefulWidget {
  const ReservationSelectTimeWidget({Key? key}) : super(key: key);

  @override
  State<ReservationSelectTimeWidget> createState() =>
      _ReservationSelectTimeWidgetState();
}

class _ReservationSelectTimeWidgetState
    extends State<ReservationSelectTimeWidget> {
  late final ReservationBloc _reservationBloc;

  @override
  void initState() {
    super.initState();
    _reservationBloc = BlocProvider.of<ReservationBloc>(context);
  }

  bool _isEnableTime(DateTime? date, PartTime partTime) {
    return DateTimeUtils.isDateWithinOneHour(
      DateTimeUtils.dateTimeWithPartTime(
        date ?? DateTime.now(),
        partTime,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
      bloc: _reservationBloc,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "예약 시간",
                style: TextStyle(
                  color: ColorsConstants.divider,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Visibility(
                visible: _isEnableTime(
                  state.dateTime ?? DateTime.now(),
                  PartTime.partA,
                ),
                child: RadioListTile(
                  value: 0,
                  groupValue: state.selectedTime,
                  title: Text(
                    "PM 1:00",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onChanged: (val) {
                    _reservationBloc.add(
                      ReservationRadioTimeSelectEvent(
                        selectedTime: val ?? 0,
                      ),
                    );
                  },
                  activeColor: ColorsConstants.inProgressColor,
                  contentPadding: EdgeInsets.all(0),
                  selected: state.selectedTime == 0,
                ),
              ),
              Visibility(
                visible: _isEnableTime(
                  state.dateTime ?? DateTime.now(),
                  PartTime.partB,
                ),
                child: RadioListTile(
                  value: 1,
                  groupValue: state.selectedTime,
                  title: Text(
                    "PM 5:50",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onChanged: (val) {
                    _reservationBloc.add(
                      ReservationRadioTimeSelectEvent(
                        selectedTime: val ?? 1,
                      ),
                    );
                  },
                  activeColor: ColorsConstants.inProgressColor,
                  contentPadding: EdgeInsets.all(0),
                  selected: state.selectedTime == 1,
                ),
              ),
              Visibility(
                visible: _isEnableTime(
                  state.dateTime ?? DateTime.now(),
                  PartTime.partC,
                ),
                child: RadioListTile(
                  value: 2,
                  groupValue: state.selectedTime,
                  title: Text(
                    "PM 8:00",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onChanged: (val) {
                    _reservationBloc.add(
                      ReservationRadioTimeSelectEvent(
                        selectedTime: val ?? 2,
                      ),
                    );
                  },
                  activeColor: ColorsConstants.inProgressColor,
                  contentPadding: EdgeInsets.all(0),
                  selected: state.selectedTime == 2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
