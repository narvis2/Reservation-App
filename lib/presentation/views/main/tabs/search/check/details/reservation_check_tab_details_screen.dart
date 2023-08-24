import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/di/dependency_injection_graph.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/bloc/reservation_check_detail_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_dtails_view.dart';

@RoutePage()
class ReservationCheckTabDetailsScreen extends StatelessWidget {
  final int? id;
  final String? certificationNumber;

  const ReservationCheckTabDetailsScreen({
    Key? key,
    this.id,
    this.certificationNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<ReservationCheckDetailBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.background,
          centerTitle: true,
          title: Text(
            "예약 상세 정보",
            style: TextStyle(
              fontSize: 16,
              color: ColorsConstants.splashText,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: AutoLeadingButton(color: ColorsConstants.splashText),
          elevation: 3,
        ),
        body: SafeArea(
          child: ReservationCheckDetailsView(
            id: id,
            certificationNumber: certificationNumber,
          ),
        ),
      ),
    );
  }
}
