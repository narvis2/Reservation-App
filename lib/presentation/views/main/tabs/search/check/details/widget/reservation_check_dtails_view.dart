import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/bloc/reservation_check_detail_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_detail_botton.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_detail_info_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_detail_seat_info_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_check_detail_terms_agree_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/widget/reservation_detail_user_info_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/utils/check_utils.dart';

class ReservationCheckDetailsView extends StatefulWidget {
  final int? id;
  final String? certificationNumber;

  const ReservationCheckDetailsView({
    Key? key,
    required this.id,
    this.certificationNumber,
  }) : super(key: key);

  @override
  State<ReservationCheckDetailsView> createState() =>
      _ReservationCheckDetailsViewState();
}

class _ReservationCheckDetailsViewState
    extends State<ReservationCheckDetailsView> {
  late final ReservationCheckDetailBloc _reservationCheckDetailBloc;

  @override
  void initState() {
    super.initState();
    _reservationCheckDetailBloc = BlocProvider.of(context)
      ..add(
        ReservationRequestCheckDetailInitDataEvent(
          id: widget.id,
          certificationNumber: widget.certificationNumber,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationCheckDetailBloc,
        ReservationCheckDetailState>(
      bloc: _reservationCheckDetailBloc,
      listenWhen: (previous, current) {
        return previous != current &&
            previous.checkStatus != current.checkStatus;
      },
      listener: (context, state) {
        if (state.checkStatus == ReservationCheckStatus.loading) {
          DialogUtils.showLoadingDialog(context);
        } else if (state.checkStatus == ReservationCheckStatus.success) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }

          SnackBarUtils.showCustomSnackBar(
            context,
            "완료되었습니다.",
          );

          Navigator.of(context).pop("aaa");
        } else if (state.checkStatus == ReservationCheckStatus.error) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }

          SnackBarUtils.showCustomSnackBar(
            context,
            state.checkErrorMsg ?? Constants.networkError,
          );
        }
      },
      buildWhen: (previous, current) {
        return previous != current &&
            previous.detailInfoStatus != current.detailInfoStatus;
      },
      builder: (context, state) {
        if (state.detailInfoStatus == ReservationDetailInfoStatus.loading) {
          return const NetworkLoadingWidget();
        } else if (state.detailInfoStatus ==
            ReservationDetailInfoStatus.error) {
          return NetworkErrorWidget(
            errorMessage: state.detailsInfoErrorMsg ?? Constants.dataError,
          );
        } else if (state.detailInfoStatus ==
            ReservationDetailInfoStatus.success) {
          final result = state.reservationDetailModel;

          if (result != null) {
            return Container(
              color: ColorsConstants.settingDivider,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 예약자 정보
                    ReservationDetailUserInfoWidget(
                      name: result.name,
                      phoneNumber: CheckUtils.makePhoneNumber(
                        result.phoneNumber,
                      ),
                      isAuthPhone: result.isUserValidation,
                      isAdmin: widget.certificationNumber == null,
                    ),
                    Container(
                      constraints: const BoxConstraints.expand(
                        height: 5.0,
                      ),
                    ),
                    // 예약 정보
                    ReservationCheckDetailInfoWidget(
                      isApproved: result.certificationNumber != null,
                      reservationDateTime: result.reservationDateTime,
                      reservationCount: result.reservationCount,
                      certificationNumber: result.certificationNumber,
                    ),
                    Container(
                      constraints: const BoxConstraints.expand(
                        height: 5.0,
                      ),
                    ),
                    // 약관 동의
                    ReservationCheckDetailTermsAgreeWidget(
                      isAgree: result.isTermAllAgree,
                    ),
                    Container(
                      constraints: const BoxConstraints.expand(
                        height: 5.0,
                      ),
                    ),
                    // 좌석 정보
                    ReservationCheckDetailSeatInfoWidget(
                      count: result.reservationCount,
                      seats: result.seats,
                    ),
                    Container(
                      constraints: const BoxConstraints.expand(
                        height: 20.0,
                      ),
                    ),
                    // 버튼
                    ReservationCheckDetailButton(
                      isAuth: widget.certificationNumber == null &&
                          result.certificationNumber != null,
                      onRemoveClick: () {
                        DialogUtils.showBasicDialog(
                          context: context,
                          title: "예약 거절",
                          message:
                              "${result.name}님의 예약을 거절하시겠습니까?\n(예약을 거절하면 삭제 처리됩니다.)",
                          enableCancelBtn: true,
                          onConfirmClick: () {
                            _reservationCheckDetailBloc.add(
                              ReservationCheckDetailCheckEvent(
                                id: result.id,
                                isApproval: false,
                              ),
                            );
                          },
                        );
                      },
                      onApprovalClick: () {
                        DialogUtils.showBasicDialog(
                          context: context,
                          title: "예약 승인",
                          message: "${result.name}님의 예약을 승인하시겠습니까?",
                          enableCancelBtn: true,
                          onConfirmClick: () {
                            _reservationCheckDetailBloc.add(
                              ReservationCheckDetailCheckEvent(
                                id: result.id,
                                isApproval: true,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        }

        return SizedBox();
      },
    );
  }
}
