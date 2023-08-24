import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/bloc/reservation_check_detail_bloc.dart';

class ReservationCheckDetailsView extends StatefulWidget {
  final int? id;
  final String? certificationNumber;

  const ReservationCheckDetailsView({
    Key? key,
    required this.id,
    this.certificationNumber,
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
        ReservationRequestCheckDetailInitDataEvent(
          id: widget.id,
          certificationNumber: widget.certificationNumber,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstants.splashText,
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [

        ],
      ),
    );
  }
}
