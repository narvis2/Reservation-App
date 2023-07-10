import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/second/reservation_second_bloc.dart';

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
    final reservationSecondBloc =
        BlocProvider.of<ReservationSecondBloc>(context)
          ..add(ReservationSecondEventGetSeatList(
            partTime: reservationBloc.state.selectedTime,
            date: reservationBloc.state.dateTime,
            count: reservationBloc.state.selectedCount,
          ));

    return Expanded(
      child: BlocBuilder<ReservationSecondBloc, ReservationSecondState>(
        bloc: reservationSecondBloc,
        builder: (context, state) {
          return Container(
            child: Text("좌석선택"),
          );
        },
      ),
    );
  }
}
