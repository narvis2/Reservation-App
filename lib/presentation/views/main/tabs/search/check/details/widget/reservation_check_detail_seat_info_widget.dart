import 'package:flutter/material.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_detail_content_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/utils/check_utils.dart';

class ReservationCheckDetailSeatInfoWidget extends StatelessWidget {
  final int count;
  final List<SeatType> seats;

  const ReservationCheckDetailSeatInfoWidget({
    Key? key,
    required this.count,
    required this.seats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorsConstants.background,
        borderRadius: BorderRadius.circular(5), // 5의 radius를 적용
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "좌석 정보",
            style: TextStyle(
              color: ColorsConstants.boldColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(
              height: 10.0,
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            constraints: const BoxConstraints.expand(
              height: 15.0,
            ),
          ),
          ReservationCheckDetailContentWidget(
            title: "좌석 타입",
            content: CheckUtils.makeReservationCountToSeatName(
              count,
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(
              height: 15.0,
            ),
          ),
          Visibility(
            visible: count < 4,
            child: ReservationCheckDetailContentWidget(
              title: "선택한 좌석",
            ),
          ),
          Visibility(
            visible: count < 4,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 50,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: seats.length,
                padding: EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsConstants.strokeColor,
                    ),
                    child: Center(
                      child: Text(
                        seats[index].name,
                        style: TextStyle(
                          color: ColorsConstants.background,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
