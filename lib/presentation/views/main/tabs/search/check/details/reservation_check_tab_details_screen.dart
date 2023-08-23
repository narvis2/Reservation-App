import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/di/dependency_injection_graph.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/bloc/reservation_check_detail_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_dtails_view.dart';

@RoutePage()
class ReservationCheckTabDetailsScreen extends StatelessWidget {
  final int id;
  final String title;

  const ReservationCheckTabDetailsScreen({
    Key? key,
    required this.id,
    required this.title,
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
            title,
            style: TextStyle(
              fontSize: 16,
              color: ColorsConstants.splashText,
            ),
          ),
          leading: AutoLeadingButton(color: ColorsConstants.splashText),
          elevation: 3,
        ),
        body: SafeArea(
          child: ReservationCheckDetailsView(id: id,),
        ),
      ),
    );
  }
}
