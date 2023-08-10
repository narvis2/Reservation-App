import 'package:flutter/material.dart';
import 'package:reservation_app/data/model/role/role_type.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/common/bolder_text_widget.dart';

class ProfileWidget extends StatelessWidget {
  final MemberModel? memberInfo;

  const ProfileWidget({
    Key? key,
    this.memberInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final info = memberInfo;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: info != null,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsConstants.thinDivider, // 테두리 색상 지정
                    width: 2.0, // 테두리 두께 지정
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(8.0), // 원하는 패딩 설정
                child: Image.asset(
                  "assets/images/master_white.png",
                  width: 30.0,
                  height: 30.0,
                  color: ColorsConstants.primary,
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BorderTextWidget(
                    texts: [
                      [
                      (info?.name ?? ''),
                        true
                      ],
                      "(${info?.email ?? ''})",
                    ],
                    normalColors: ColorsConstants.divider,
                    bolderColors: ColorsConstants.boldColor,
                    normalFontSize: 14,
                    bolderFontSize: 14,
                    bolderFontWeight: FontWeight.w600,
                  ),
                  BorderTextWidget(
                    texts: [
                      "직책: ",
                      [
                        (info?.role ?? RoleType.notAllow.name) ==
                                RoleType.master.name
                            ? "사장님"
                            : (info?.role ?? RoleType.notAllow.name) ==
                                    RoleType.admin.name
                                ? "관리자"
                                : "",
                        true
                      ],
                    ],
                    normalColors: ColorsConstants.divider,
                    bolderColors: ColorsConstants.strokeColor,
                    normalFontSize: 12,
                    bolderFontSize: 14,
                    bolderFontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
        Visibility(
          visible: info == null,
          child: Text(
            "로그인을 해주세요!",
            style: TextStyle(
              color: ColorsConstants.boldColor,
              fontSize: 14,
              letterSpacing: -0.02,
            ),
          ),
        ),
        Visibility(
          visible: info == null,
          child: AspectRatio(
            aspectRatio: 7 / 12,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: ColorsConstants.rightActionButton,
            ),
          ),
        ),
      ],
    );
  }
}
