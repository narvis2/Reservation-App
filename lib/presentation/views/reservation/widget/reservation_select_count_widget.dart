import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';

// 예약 인원수 선택 Widget
class ReservationSelectCountWidget extends StatefulWidget {
  const ReservationSelectCountWidget({Key? key}) : super(key: key);

  @override
  State<ReservationSelectCountWidget> createState() =>
      _ReservationSelectCountWidgetState();
}

class _ReservationSelectCountWidgetState
    extends State<ReservationSelectCountWidget> {
  @override
  Widget build(BuildContext context) {
    final reservationBloc = context.read<ReservationBloc>();

    return BlocSelector<ReservationBloc, ReservationState, int>(
      selector: (state) {
        return state.selectedCount;
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              RadioListTile(
                value: 0,
                groupValue: state,
                title: Text(
                  "1~3인 이하",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onChanged: (val) {
                  reservationBloc.add(
                    ReservationSelectedCountEvent(
                      reservationCount: val ?? 0,
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
                  "4~5인 이하",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  "4인실로 안내받을 수 있어요!",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onChanged: (val) {
                  reservationBloc.add(
                    ReservationSelectedCountEvent(
                      reservationCount: val ?? 1,
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
                  "6인 이상",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  "6인실로 안내받을 수 있어요!",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onChanged: (val) {
                  reservationBloc.add(
                    ReservationSelectedCountEvent(
                      reservationCount: val ?? 2,
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
