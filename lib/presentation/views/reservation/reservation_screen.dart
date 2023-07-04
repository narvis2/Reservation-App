import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:timelines/timelines.dart';

import 'widget/BezierPainter.dart';

@RoutePage()
class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  // Process 처음 시작
  int _processIndex = 0;
  int _selectedTime = 0;
  int _selectedCount = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Color getColor(int index) {
    if (index == _processIndex) {
      return ColorsConstants.inProgressColor;
    } else if (index < _processIndex) {
      return ColorsConstants.completeColor;
    } else {
      return ColorsConstants.todoColor;
    }
  }

  void setSelectedTime(int val) {
    setState(() {
      _selectedTime = val;
    });
  }

  void setSelectedCount(int val) {
    setState(() {
      _selectedCount = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "예약하기",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorsConstants.divider,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorsConstants.divider,
          ),
          onPressed: () {
            AutoRouter.of(context).back();
          },
        ),
        elevation: 3,
      ),
      body: Column(
        children: [
          SizedBox(
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
                        color: getColor(index),
                        fontSize: 13,
                      ),
                    ),
                  );
                },
                indicatorBuilder: (_, index) {
                  Color color;
                  var child;

                  if (index == _processIndex) {
                    // 📌 현재 Process - Indicator 가 돌고있음
                    color = ColorsConstants.inProgressColor;
                    child = Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    );
                  } else if (index < _processIndex) {
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

                  if (index <= _processIndex) {
                    // 📌 완료했거나 현재 진행중인 Process - 꽉 찬 원 모양
                    return Stack(
                      children: [
                        CustomPaint(
                          size: Size(30.0, 30.0),
                          painter: BezierPainter(
                            color: color,
                            drawStart: index > 0,
                            drawEnd: index < _processIndex,
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
                    if (index == _processIndex) {
                      final prevColor = getColor(index - 1);
                      final color = getColor(index);
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
                        color: getColor(index),
                      );
                    }
                  } else {
                    return null;
                  }
                },
                itemCount: Constants.reservationProcessList.length,
              ),
            ),
          ),
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
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              width: double.infinity,
              child: ListView(
                children: [
                  Text(
                    '예약 날짜/시간 선택',
                    style: TextStyle(
                      color: ColorsConstants.divider,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "예약 날짜",
                              style: TextStyle(
                                color: ColorsConstants.divider,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                  BorderSide(
                                    color: ColorsConstants.inProgressColor,
                                  ),
                                ),
                                // 테두리 선 색상
                                foregroundColor: MaterialStateProperty.all(
                                  ColorsConstants.divider,
                                ), // 텍스트 색상
                              ),
                              child: Text(
                                "2023-07-03",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          constraints:
                              const BoxConstraints.expand(height: 10.0),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "예약 시간",
                                style: TextStyle(
                                  color: ColorsConstants.divider,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              RadioListTile(
                                value: 0,
                                groupValue: _selectedTime,
                                title: Text(
                                  "PM 1:00",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onChanged: (val) {
                                  setSelectedTime(val ?? 0);
                                },
                                activeColor: ColorsConstants.inProgressColor,
                                contentPadding: EdgeInsets.all(0),
                                selected: _selectedTime == 0,
                              ),
                              RadioListTile(
                                value: 1,
                                groupValue: _selectedTime,
                                title: Text(
                                  "PM 5:50",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onChanged: (val) {
                                  setSelectedTime(val ?? 0);
                                },
                                activeColor: ColorsConstants.inProgressColor,
                                contentPadding: EdgeInsets.all(0),
                                selected: _selectedTime == 1,
                              ),
                              RadioListTile(
                                value: 2,
                                groupValue: _selectedTime,
                                title: Text(
                                  "PM 5:50",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onChanged: (val) {
                                  setSelectedTime(val ?? 0);
                                },
                                activeColor: ColorsConstants.inProgressColor,
                                contentPadding: EdgeInsets.all(0),
                                selected: _selectedTime == 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  Container(
                    constraints: const BoxConstraints.expand(height: 10.0),
                  ),
                  Text(
                    "예약 인원수",
                    style: TextStyle(
                      color: ColorsConstants.divider,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints.expand(height: 10.0),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        RadioListTile(
                          value: 0,
                          groupValue: _selectedCount,
                          title: Text(
                            "1~3인 이하",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onChanged: (val) {
                            setSelectedCount(val ?? 0);
                          },
                          activeColor: ColorsConstants.inProgressColor,
                          contentPadding: EdgeInsets.all(0),
                          selected: _selectedCount == 0,
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: _selectedCount,
                          title: Text(
                            "4~5인 이하",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            "4인실로 안내받을 수 있어요!",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onChanged: (val) {
                            setSelectedCount(val ?? 1);
                          },
                          activeColor: ColorsConstants.inProgressColor,
                          contentPadding: EdgeInsets.all(0),
                          selected: _selectedCount == 1,
                        ),
                        RadioListTile(
                          value: 2,
                          groupValue: _selectedCount,
                          title: Text(
                            "6인 이상",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            "6인실로 안내받을 수 있어요!",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onChanged: (val) {
                            setSelectedCount(val ?? 2);
                          },
                          activeColor: ColorsConstants.inProgressColor,
                          contentPadding: EdgeInsets.all(0),
                          selected: _selectedCount == 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _processIndex =
                (_processIndex + 1) % Constants.reservationProcessList.length;
          });
        },
        backgroundColor: ColorsConstants.inProgressColor,
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
