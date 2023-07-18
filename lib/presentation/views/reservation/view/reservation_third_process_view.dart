import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/reservation/term/reservation_term_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/common/bolder_text_widget.dart';
import 'package:reservation_app/presentation/views/common/check_box_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/third/reservation_third_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/widget/adapter/reservation_term_list_adapter.dart';

class ReservationThirdProcessView extends StatefulWidget {
  const ReservationThirdProcessView({Key? key}) : super(key: key);

  @override
  State<ReservationThirdProcessView> createState() =>
      _ReservationThirdProcessViewState();
}

class _ReservationThirdProcessViewState
    extends State<ReservationThirdProcessView> {
  @override
  Widget build(BuildContext context) {
    final reservationBloc = BlocProvider.of<ReservationBloc>(context);
    final reservationThirdBloc = context.read<ReservationThirdBloc>()
      ..add(
        ReservationThirdTermListEvent(),
      );

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 30.0,
          right: 30.0,
          bottom: 20.0,
        ),
        child: Column(
          children: [
            BorderTextWidget(
              texts: [
                "우회담 ",
                ["이용약관", true],
                "에 ",
                ["동의", true],
                "하시면",
              ],
            ),
            BorderTextWidget(
              texts: [
                ["예약", true],
                "이 ",
                ["완료", true],
                "됩니다.",
              ],
            ),
            BlocListener<ReservationThirdBloc, ReservationThirdState>(
              listener: (context, state) {
                if (state is ReservationThirdStateTermList) {
                  reservationBloc.add(ReservationTermAllAgreeEvent(
                    isAllSelected: state.termsList
                        .where((item) => !item.isChecked)
                        .isEmpty,
                  ));
                }
              },
              child: BlocBuilder<ReservationThirdBloc, ReservationThirdState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case ReservationThirdStateLoading:
                      return const NetworkLoadingWidget();

                    case ReservationThirdStateTermList:
                      final List<ReservationTermModel> termList =
                          (state as ReservationThirdStateTermList).termsList;

                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: termList
                                        .where((item) => !item.isChecked)
                                        .isEmpty
                                    ? ColorsConstants.strokeColor
                                    : ColorsConstants.strokeGray,
                                width: 2.0, // 테두리 너비 설정
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                CheckBoxWidget(
                                  isChecked: termList
                                      .where((item) => !item.isChecked)
                                      .isEmpty,
                                  onClickEvent: () {
                                    reservationThirdBloc.add(
                                      ReservationThirdTermSelectAllEvent(
                                        isAllSelected: termList
                                            .where((item) => !item.isChecked)
                                            .isNotEmpty,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(width: 12),
                                Text(
                                  "전체동의",
                                  style: TextStyle(
                                    color: ColorsConstants.boldColor,
                                    fontSize: 14,
                                    fontWeight: termList
                                            .where((item) => !item.isChecked)
                                            .isEmpty
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            constraints:
                                const BoxConstraints.expand(height: 15.0),
                          ),
                          ReservationTermListAdapter(
                            termList: termList,
                            onClickEvent: ({
                              required int selectedItem,
                            }) {
                              reservationThirdBloc.add(
                                ReservationThirdTermClickEvent(
                                  selectedIndex: selectedItem,
                                ),
                              );
                            },
                          ),
                        ],
                      );

                    default:
                      return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
