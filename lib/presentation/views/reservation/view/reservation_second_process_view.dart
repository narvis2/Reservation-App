import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';

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
    return Expanded(
      child: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          return Container(
            child: Text("좌석선택"),
          );
        },
      ),
    );
  }
}
