import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/di/dependency_inection_graph.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/fourth/reservation_fourth_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/second/reservation_second_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/third/reservation_third_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/view/reservation_process_view.dart';
import 'package:reservation_app/presentation/views/reservation/widget/reservation_app_bar_widget.dart';

import 'widget/close_floating_action_widget.dart';

@RoutePage()
class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  Color getColor({required int index, required int processIndex}) {
    if (index == processIndex) {
      return ColorsConstants.inProgressColor;
    } else if (index < processIndex) {
      return ColorsConstants.completeColor;
    } else {
      return ColorsConstants.todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReservationBloc>(
          create: (context) => locator.get<ReservationBloc>(),
        ),
        BlocProvider<ReservationSecondBloc>(
          create: (context) => locator.get<ReservationSecondBloc>(),
        ),
        BlocProvider<ReservationThirdBloc>(
          create: (context) => locator.get<ReservationThirdBloc>(),
        ),
        BlocProvider<ReservationFourthBloc>(
          create: (context) => locator.get<ReservationFourthBloc>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ReservationAppBarWidget(),
        body: SafeArea(
          child: ReservationProcessView(),
        ),
        floatingActionButton: CloseFloatingActionWidget(),
      ),
    );
  }
}
