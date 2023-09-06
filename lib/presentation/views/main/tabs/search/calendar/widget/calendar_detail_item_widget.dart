import 'package:flutter/material.dart';
import 'package:reservation_app/domain/model/reservation/reservation_range_section_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';
import 'package:reservation_app/presentation/views/common/bolder_text_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/utils/check_utils.dart';

class CalendarDetailItemWidget extends StatefulWidget {
  final ReservationRangeSectionModel item;

  const CalendarDetailItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<CalendarDetailItemWidget> createState() =>
      _CalendarDetailItemWidgetState();
}

class _CalendarDetailItemWidgetState extends State<CalendarDetailItemWidget> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.item.list.length,
      itemBuilder: (context, index) {
        final item = widget.item.list[index];
        final isAuthUser = widget.item.list[index].certificationNumber != null;

        return Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: index == widget.item.list.length - 1 ? null : BoxDecoration(
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
                        color: isAuthUser
                            ? ColorsConstants.strokeColor
                            : ColorsConstants.primary,
                        width: 2.0,
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      isAuthUser ? Icons.check : Icons.close,
                      color: isAuthUser
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
                            (item.name),
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
                              item.reservationCount,
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
                              item.reservationDateTime,
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
            ],
          ),
        );
      },
    );
  }
}
