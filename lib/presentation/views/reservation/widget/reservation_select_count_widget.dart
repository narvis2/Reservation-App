import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/widget/real_user_input_widget.dart';

// 예약 인원수 선택 Widget
class ReservationSelectCountWidget extends StatefulWidget {
  final Function() onScrollBottom;

  const ReservationSelectCountWidget({Key? key, required this.onScrollBottom}) : super(key: key);

  @override
  State<ReservationSelectCountWidget> createState() =>
      _ReservationSelectCountWidgetState();
}

class _ReservationSelectCountWidgetState
    extends State<ReservationSelectCountWidget> {
  @override
  Widget build(BuildContext context) {
    final reservationBloc = context.read<ReservationBloc>();

    return BlocBuilder<ReservationBloc, ReservationState>(
      bloc: reservationBloc,
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              RadioListTile(
                value: 0,
                groupValue: state.selectedCount,
                title: Text(
                  "1~3인 이하",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  "좌석을 선택할 수 있어요!",
                  style: TextStyle(
                    fontSize: 12,
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
                selected: state.selectedCount == 0,
              ),
              RealUserInputWidget(
                isVisible: state.selectedCount == 0,
                realSelectedUser: state.realUserCount,
                onClickPlus: () {
                  reservationBloc.add(
                    ReservationInputRealUserCountAddEvent(),
                  );
                },
                onClickMinus: () {
                  reservationBloc.add(
                    ReservationInputRealUserCountMinusEvent(),
                  );
                },
              ),
              RadioListTile(
                value: 1,
                groupValue: state.selectedCount,
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
                selected: state.selectedCount == 1,
              ),
              RealUserInputWidget(
                isVisible: state.selectedCount == 1,
                realSelectedUser: state.realUserCount,
                onClickPlus: () {
                  reservationBloc.add(
                    ReservationInputRealUserCountAddEvent(),
                  );
                },
                onClickMinus: () {
                  reservationBloc.add(
                    ReservationInputRealUserCountMinusEvent(),
                  );
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: state.selectedCount,
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
                  widget.onScrollBottom();
                },
                activeColor: ColorsConstants.inProgressColor,
                contentPadding: EdgeInsets.all(0),
                selected: state.selectedCount == 2,
              ),
              RealUserInputWidget(
                isVisible: state.selectedCount == 2,
                realSelectedUser: state.realUserCount,
                onClickPlus: () {
                  reservationBloc.add(
                    ReservationInputRealUserCountAddEvent(),
                  );
                },
                onClickMinus: () {
                  reservationBloc.add(
                    ReservationInputRealUserCountMinusEvent(),
                  );
                },
              ),
              Visibility(
                visible: state.selectedCount == 2,
                child: Container(
                  constraints: const BoxConstraints.expand(height: 50.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
