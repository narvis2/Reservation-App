import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_detail_content_button_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_detail_content_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservationDetailUserInfoWidget extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final bool isAuthPhone;
  final bool isAdmin;

  const ReservationDetailUserInfoWidget({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.isAuthPhone,
    required this.isAdmin,
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
            "예약자 정보",
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
            title: "이름",
            content: name,
          ),
          Container(
            constraints: const BoxConstraints.expand(
              height: 10.0,
            ),
          ),
          isAdmin ? ReservationCheckDetailContentButtonWidget(
            title: "휴대폰 번호",
            content: phoneNumber,
            contentIcon: Icons.call,
            contentColor: ColorsConstants.inProgressColor,
            onClickEvent: () async {
              final Uri launchUri = Uri(
                scheme: 'tel',
                path: phoneNumber,
              );

              await launchUrl(launchUri);
            },
          ) : ReservationCheckDetailContentWidget(
            title: "휴대폰 번호",
            content: phoneNumber,
          ),
          Container(
            constraints: const BoxConstraints.expand(
              height: 10.0,
            ),
          ),
          ReservationCheckDetailContentWidget(
            title: "휴대폰 인증 여부",
            content: isAuthPhone ? "인증된 휴대폰" : "인증되지 않은 휴대폰",
            contentColor: ColorsConstants.strokeColor,
          ),
        ],
      ),
    );
  }
}
