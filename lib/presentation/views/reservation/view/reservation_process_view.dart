import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';

import 'reservation_fifth_process_view.dart';
import 'reservation_first_process_view.dart';
import 'reservation_fourth_process_view.dart';
import 'reservation_process_top_view.dart';
import 'reservation_second_process_view.dart';
import 'reservation_third_process_view.dart';

class ReservationProcessView extends StatefulWidget {
  const ReservationProcessView({Key? key}) : super(key: key);

  @override
  State<ReservationProcessView> createState() => _ReservationProcessViewState();
}

class _ReservationProcessViewState extends State<ReservationProcessView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReservationProcessTopView(),
        Container(
          constraints: const BoxConstraints.expand(height: 10.0),
        ),
        Divider(
          height: 1,
          thickness: 3,
          indent: 15,
          endIndent: 15,
          color: ColorsConstants.inProgressColor,
        ),
        BlocSelector<ReservationBloc, ReservationState, int>(
          selector: (state) {
            return state.currentPosition;
          },
          builder: (context, state) {
            switch (state) {
              case 0:
                return ReservationFirstProcessView();
              case 1:
                return ReservationSecondProcessView();
              case 2:
                return ReservationThirdProcessView();
              case 3:
                return ReservationFourthProcessView();
              case 4:
                return ReservationFifthProcessView();
              default:
                return SizedBox(); // 기본값으로 처리할 경우에 대한 예시
            }
          },
        ),
      ],
    );
  }
}
