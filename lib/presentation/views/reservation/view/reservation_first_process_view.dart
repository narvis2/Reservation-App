import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/reservation/widget/reservation_select_count_widget.dart';
import 'package:reservation_app/presentation/views/reservation/widget/reservation_select_date_widget.dart';
import 'package:reservation_app/presentation/views/reservation/widget/reservation_select_time_widget.dart';

class ReservationFirstProcessView extends StatefulWidget {
  const ReservationFirstProcessView({Key? key}) : super(key: key);

  @override
  State<ReservationFirstProcessView> createState() =>
      _ReservationFirstProcessViewState();
}

class _ReservationFirstProcessViewState
    extends State<ReservationFirstProcessView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500), // 스크롤 애니메이션 소요 시간
      curve: Curves.easeOut, // 스크롤 애니메이션 효과
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        child: ListView(
          controller: _scrollController,
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
                  ReservationSelectDateWidget(), // 날짜 선택
                  Container(
                    constraints: const BoxConstraints.expand(height: 10.0),
                  ),
                  ReservationSelectTimeWidget(), // 시간 선택
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
            ReservationSelectCountWidget(
              onScrollBottom: () {
                scrollToBottom();
              },
            ),
          ],
        ),
      ),
    );
  }
}
