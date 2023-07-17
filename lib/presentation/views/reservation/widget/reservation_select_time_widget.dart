import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
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
  @override
  Widget build(BuildContext context) {
    final reservationBloc = context.read<ReservationBloc>();

    return BlocSelector<ReservationBloc, ReservationState, int>(
      selector: (state) {
        return state.selectedTime;
      },
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
              RadioListTile(
                value: 0,
                groupValue: state,
                title: Text(
                  "PM 1:00",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onChanged: (val) {
                  reservationBloc.add(
                    ReservationRadioTimeSelectEvent(
                      selectedTime: val ?? 0,
                    ),
                  );
                },
                activeColor: ColorsConstants.inProgressColor,
                contentPadding: EdgeInsets.all(0),
                selected: state == 0,
              ),
              RadioListTile(
                value: 1,
                groupValue: state,
                title: Text(
                  "PM 5:50",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onChanged: (val) {
                  reservationBloc.add(
                    ReservationRadioTimeSelectEvent(
                      selectedTime: val ?? 1,
                    ),
                  );
                },
                activeColor: ColorsConstants.inProgressColor,
                contentPadding: EdgeInsets.all(0),
                selected: state == 1,
              ),
              RadioListTile(
                value: 2,
                groupValue: state,
                title: Text(
                  "PM 8:00",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onChanged: (val) {
                  reservationBloc.add(
                    ReservationRadioTimeSelectEvent(
                      selectedTime: val ?? 2,
                    ),
                  );
                },
                activeColor: ColorsConstants.inProgressColor,
                contentPadding: EdgeInsets.all(0),
                selected: state == 2,
              ),
            ],
          ),
        );
      },
    );
  }
}
