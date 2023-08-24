import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/bloc/reservation_check_detail_bloc.dart';
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
    return BlocBuilder<ReservationCheckDetailBloc, ReservationCheckDetailState>(
      bloc: _reservationCheckDetailBloc,
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const NetworkLoadingWidget();
          },
          error: (errorMsg) {
            return NetworkErrorWidget(
              errorMessage: errorMsg ?? Constants.dataError,
            );
          },
          success: (data) {
            final result = data;
            return result != null
                ? Container(
                    color: ColorsConstants.settingDivider,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 예약자 정보
                        ReservationDetailUserInfoWidget(
                          name: result.name,
                          phoneNumber: CheckUtils.makePhoneNumber(
                            result.phoneNumber,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox();
          },
          orElse: () {
            return SizedBox();
          },
        );
      },
    );
  }
}
