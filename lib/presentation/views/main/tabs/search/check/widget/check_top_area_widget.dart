import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/common/bolder_text_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/bloc/reservation_check_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/widget/expand/expand_filter_widget.dart';

class CheckTopAreaWidget extends StatefulWidget {
  const CheckTopAreaWidget({Key? key}) : super(key: key);

  @override
  State<CheckTopAreaWidget> createState() => _CheckTopAreaWidgetState();
}

class _CheckTopAreaWidgetState extends State<CheckTopAreaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorsConstants.thinDivider,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocSelector<ReservationCheckBloc, ReservationCheckState, int>(
            selector: (state) {
              return state.totalCount;
            },
            builder: (context, state) {
              return BorderTextWidget(
                texts: [
                  "총 예약 : ",
                  [state.toString(), true]
                ],
                normalColors: ColorsConstants.divider,
                normalFontSize: 13,
                bolderColors: state == 0 ? ColorsConstants.primary : ColorsConstants.strokeColor,
                bolderFontSize: 14,
                bolderFontWeight: FontWeight.bold,
              );
            },
          ),
          ExpandFilterWidget(),
        ],
      ),
    );
  }
}
