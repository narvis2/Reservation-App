import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_detail_content_widget.dart';

class ReservationCheckDetailTermsAgreeWidget extends StatelessWidget {
  final bool isAgree;

  const ReservationCheckDetailTermsAgreeWidget({
    Key? key,
    required this.isAgree,
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
            "약관 동의",
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
            title: "약관 동의 여부",
            content: isAgree ? "동의 완료" : "미동의",
            contentColor: isAgree
                ? ColorsConstants.strokeColor
                : ColorsConstants.primary,
          ),
        ],
      ),
    );
  }
}
