import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/widget/BezierPainter.dart';
import 'package:timelines/timelines.dart';

import '../../../utils/color_constants.dart';

class ReservationProcessTopView extends StatefulWidget {
  const ReservationProcessTopView({Key? key}) : super(key: key);

  @override
  State<ReservationProcessTopView> createState() =>
      _ReservationProcessTopViewState();
}

class _ReservationProcessTopViewState extends State<ReservationProcessTopView> {
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
    return BlocSelector<ReservationBloc, ReservationState, int>(
      selector: (state) {
        return state.currentPosition;
      },
      builder: (context, state) {
        return SizedBox(
          height: 100,
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
              direction: Axis.horizontal,
              connectorTheme: ConnectorThemeData(
                space: 30.0,
                thickness: 5.0,
              ),
            ),
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              itemExtentBuilder: (_, __) =>
                  MediaQuery.of(context).size.width /
                  Constants.reservationProcessList.length,
              // 📌 TimeLine 위에 뭔가 넣고 싶을때 넣으면 됨
              // oppositeContentsBuilder: (context, index) {
              // },
              // 📌 TimeLine 아래에 뭔가 넣고 싶을때 넣으면 됨
              contentsBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    Constants.reservationProcessList[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: getColor(index: index, processIndex: state),
                      fontSize: 13,
                    ),
                  ),
                );
              },
              indicatorBuilder: (_, index) {
                Color color;
                var child;

                if (index == state) {
                  // 📌 현재 Process - Indicator 가 돌고있음
                  color = ColorsConstants.inProgressColor;
                  child = Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  );
                } else if (index < state) {
                  // 📌 완료된 Process - Indicator 가 없어지고 check Icon 으로 대체
                  color = ColorsConstants.completeColor;
                  child = Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15.0,
                  );
                } else {
                  color = ColorsConstants.todoColor;
                }

                if (index <= state) {
                  // 📌 완료했거나 현재 진행중인 Process - 꽉 찬 원 모양
                  return Stack(
                    children: [
                      CustomPaint(
                        size: Size(30.0, 30.0),
                        painter: BezierPainter(
                          color: color,
                          drawStart: index > 0,
                          drawEnd: index < state,
                        ),
                      ),
                      DotIndicator(
                        size: 30.0,
                        color: color,
                        child: child,
                      ),
                    ],
                  );
                } else {
                  // 📌 앞으로 진행할 Process(대기중) - OutLine 원 모양
                  return Stack(
                    children: [
                      CustomPaint(
                        size: Size(15.0, 15.0),
                        painter: BezierPainter(
                          color: color,
                          drawEnd: index <
                              Constants.reservationProcessList.length - 1,
                        ),
                      ),
                      OutlinedDotIndicator(
                        borderWidth: 4.0,
                        color: color,
                      ),
                    ],
                  );
                }
              },
              // 📌 Process 를 연결해주는 선
              connectorBuilder: (_, index, type) {
                if (index > 0) {
                  if (index == state) {
                    final prevColor =
                        getColor(index: index - 1, processIndex: state);
                    final color = getColor(index: index, processIndex: state);
                    List<Color> gradientColors;
                    if (type == ConnectorType.start) {
                      gradientColors = [
                        Color.lerp(prevColor, color, 0.5)!,
                        color
                      ];
                    } else {
                      gradientColors = [
                        prevColor,
                        Color.lerp(prevColor, color, 0.5)!
                      ];
                    }
                    return DecoratedLineConnector(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradientColors,
                        ),
                      ),
                    );
                  } else {
                    return SolidLineConnector(
                      color: getColor(
                        index: index,
                        processIndex: state,
                      ),
                    );
                  }
                } else {
                  return null;
                }
              },
              itemCount: Constants.reservationProcessList.length,
            ),
          ),
        );
      },
    );
  }
}
