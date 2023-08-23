import 'package:flutter/material.dart';
import 'package:reservation_app/domain/model/reservation/page/reservation_filter_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';
import 'package:reservation_app/presentation/views/common/bolder_text_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/utils/check_utils.dart';

class ReservationFilterListAdapter extends StatefulWidget {
  final ReservationFilterModel item;
  final void Function() onItemClick;
  final void Function() onItemMoreClick;

  const ReservationFilterListAdapter({
    Key? key,
    required this.item,
    required this.onItemClick,
    required this.onItemMoreClick,
  }) : super(key: key);

  @override
  State<ReservationFilterListAdapter> createState() =>
      _ReservationFilterListAdapterState();
}

class _ReservationFilterListAdapterState
    extends State<ReservationFilterListAdapter> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onItemClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorsConstants.settingDivider,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.item.isAuthUser
                          ? ColorsConstants.strokeColor
                          : ColorsConstants.primary,
                      width: 2.0,
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    widget.item.isAuthUser ? Icons.check : Icons.close,
                    color: widget.item.isAuthUser
                        ? ColorsConstants.strokeColor
                        : ColorsConstants.primary,
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BorderTextWidget(
                      texts: [
                        "예약자 : ",
                        [
                          "${widget.item.name} (${CheckUtils.makePhoneNumber(widget.item.phoneNumber)})",
                          true
                        ]
                      ],
                      normalFontSize: 12,
                      bolderFontSize: 12,
                      normalColors: ColorsConstants.divider,
                      bolderColors: ColorsConstants.divider,
                      bolderFontWeight: FontWeight.w600,
                    ),
                    BorderTextWidget(
                      texts: [
                        "예약 인원 : ",
                        [
                          (CheckUtils.makeReservationCount(
                            widget.item.reservationCount,
                          )),
                          true
                        ]
                      ],
                      normalFontSize: 12,
                      bolderFontSize: 12,
                      normalColors: ColorsConstants.divider,
                      bolderColors: ColorsConstants.divider,
                      bolderFontWeight: FontWeight.w600,
                    ),
                    BorderTextWidget(
                      texts: [
                        "예약 시간 : ",
                        [
                          DateTimeUtils.stringToDateTime(
                            widget.item.reservationTime,
                          ),
                          true
                        ]
                      ],
                      normalFontSize: 12,
                      bolderFontSize: 12,
                      normalColors: ColorsConstants.divider,
                      bolderColors: ColorsConstants.divider,
                      bolderFontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              alignment: Alignment.topRight,
              padding: EdgeInsets.zero,
              onPressed: () {
                widget.onItemMoreClick();
              },
              icon: Icon(
                Icons.more_vert_sharp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
