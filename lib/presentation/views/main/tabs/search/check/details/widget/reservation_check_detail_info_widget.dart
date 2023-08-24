import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_detail_content_widget.dart';

class ReservationCheckDetailInfoWidget extends StatelessWidget {
  final bool isApproved;
  final String reservationDateTime;
  final int reservationCount;
  final String? certificationNumber;

  const ReservationCheckDetailInfoWidget({
    Key? key,
    required this.isApproved,
    required this.reservationDateTime,
    required this.reservationCount,
    this.certificationNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorsConstants.background,
        borderRadius:
        BorderRadius.circular(5), // 5의 radius를 적용
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "예약 정보",
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
          Divider(height: 1,),
          Container(
            constraints: const BoxConstraints.expand(
              height: 15.0,
            ),
          ),
          ReservationCheckDetailContentWidget(
            title: "예약 승인 여부",
            content: !isApproved
                ? "승인되지 않은 예약입니다."
                : "승인된 예약입니다.",
            contentColor: !isApproved
                ? ColorsConstants.primary
                : ColorsConstants.strokeColor,
          ),
          Visibility(
            visible: isApproved,
            child: Container(
              constraints: const BoxConstraints.expand(
                height: 10.0,
              ),
            ),
          ),
          Visibility(
            visible: isApproved,
            child: ReservationCheckDetailContentWidget(
              title: "예약 번호",
              content: certificationNumber ?? '',
              contentColor: ColorsConstants.strokeColor,
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(
              height: 10.0,
            ),
          ),
          ReservationCheckDetailContentWidget(
            title: "시간",
            content: reservationDateTime,
          ),
          Container(
            constraints: const BoxConstraints.expand(
              height: 10.0,
            ),
          ),
          ReservationCheckDetailContentWidget(
            title: "예약 인원 수",
            content: "$reservationCount 명",
          ),
        ],
      ),
    );
  }
}
