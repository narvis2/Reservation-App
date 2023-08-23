import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/bloc/reservation_check_detail_bloc.dart';

class ReservationCheckDetailsView extends StatefulWidget {
  final int id;
  const ReservationCheckDetailsView({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ReservationCheckDetailsView> createState() =>
      _ReservationCheckDetailsViewState();
}

class _ReservationCheckDetailsViewState
    extends State<ReservationCheckDetailsView> {
  late final ReservationCheckDetailBloc _reservationCheckDetailBloc;

  @override
  void initState() {
    super.initState();
    _reservationCheckDetailBloc = BlocProvider.of(context)
      ..add(
        ReservationRequestCheckDetailEvent(
          id: widget.id,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "ReservationCheckTabDetailsScreen",
      ),
    );
  }
}
