import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/di/dependency_inection_graph.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/view/reservation_process_view.dart';
import 'package:reservation_app/presentation/views/reservation/widget/reservation_app_bar_widget.dart';

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
    return BlocProvider(
      create: (context) => locator.get<ReservationBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ReservationAppBarWidget(),
        body: ReservationProcessView(),
        floatingActionButton:
            BlocSelector<ReservationBloc, ReservationState, ReservationProcessState?>(
          selector: (state) {
            return (state as ReservationProcessState);
          },
          builder: (context, state) {
            if (state?.dateTime == null) {
              return Container();
            }

            return FloatingActionButton(
              onPressed: () {
                context.read<ReservationBloc>().add(
                      ReservationProcessEvent(
                        processIndex: (state?.currentPosition ?? 0 + 1) %
                            Constants.reservationProcessList.length,
                      ),
                    );
              },
              backgroundColor: ColorsConstants.inProgressColor,
              child: Icon(Icons.navigate_next),
            );
          },
        ),
      ),
    );
  }
}
