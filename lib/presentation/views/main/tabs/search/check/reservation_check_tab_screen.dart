import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reservation_app/domain/model/common/bottom_sheet_model.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_approval_check_request_model.dart';
import 'package:reservation_app/presentation/config/router/app_router.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/views/common/empty_widget.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/bloc/reservation_check_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/utils/check_utils.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/widget/adapter/reservation_filter_list_adapter.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/widget/check_top_area_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservationCheckTabScreen extends StatefulWidget {
  const ReservationCheckTabScreen({Key? key}) : super(key: key);

  @override
  State<ReservationCheckTabScreen> createState() =>
      _ReservationCheckTabScreenState();
}

class _ReservationCheckTabScreenState extends State<ReservationCheckTabScreen> {
  late final ReservationCheckBloc _reservationCheckBloc;
  late final ScrollController _scrollController;
  late final RefreshController _refreshController;

  bool _isScrollToBottom = false;

  @override
  void initState() {
    super.initState();
    _reservationCheckBloc = BlocProvider.of<ReservationCheckBloc>(context)
      ..add(ReservationCheckInitEvent());

    _refreshController = RefreshController(initialRefresh: false);

    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels < 10) {
      setState(() {
        _isScrollToBottom = false;
      });

      return;
    }

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _isScrollToBottom = true;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _isScrollToBottom = false;
      });
    }
  }

  // enablePullUp 이 true 일떄 호출되는 함수 (데이터를 계속 가져올때)
  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _reservationCheckBloc.add(ReservationCheckLoadNextDataEvent());
    _refreshController.loadComplete();
  }

  // enablePullDown 이 true 일때 호출되는 함수 (Refresh)
  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _reservationCheckBloc.add(ReservationCheckRefreshEvent());
    _refreshController.refreshCompleted();
  }

  void scrollToTop() {
    _scrollController
        .animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    )
        .then((value) {
      setState(() {
        _isScrollToBottom = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _isScrollToBottom,
        child: FloatingActionButton(
          onPressed: () {
            scrollToTop();
          },
          child: Icon(Icons.arrow_upward),
        ),
      ),
      body: BlocConsumer<ReservationCheckBloc, ReservationCheckState>(
        bloc: _reservationCheckBloc,
        listenWhen: (previous, current) {
          return previous != current &&
              previous.approvalCheckStatus != current.approvalCheckStatus;
        },
        listener: (context, state) {
          if (state.approvalCheckStatus ==
              ReservationApprovalCheckStatus.loading) {
            DialogUtils.showLoadingDialog(context);
          } else if (state.approvalCheckStatus ==
              ReservationApprovalCheckStatus.success) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }

            SnackBarUtils.showCustomSnackBar(
              context,
              "완료되었습니다.",
            );

            _reservationCheckBloc.add(ReservationCheckRefreshEvent());
          } else if (state.approvalCheckStatus ==
              ReservationApprovalCheckStatus.error) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }

            SnackBarUtils.showCustomSnackBar(
              context,
              state.approvalCheckErrorMsg ?? Constants.networkError,
            );
          }
        },
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return Column(
            children: [
              CheckTopAreaWidget(), // 총 예약 수, 검색 필터 변경
              Expanded(
                child: SmartRefresher(
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  enablePullDown: true,
                  enablePullUp: state.hasNext,
                  header: WaterDropHeader(
                    completeDuration: Duration(milliseconds: 1000),
                    refresh: NetworkLoadingWidget(),
                    complete: Lottie.asset(
                      'assets/lottie/success_animation.json',
                      animate: true,
                      width: 100,
                      height: 100,
                      repeat: false,
                    ),
                  ),
                  footer: CustomFooter(
                    builder: (context, mode) {
                      if (mode == LoadStatus.loading) {
                        return NetworkLoadingWidget();
                      }

                      return SizedBox.shrink();
                    },
                  ),
                  child: buildReservationListWidget(state),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildReservationListWidget(ReservationCheckState state) {
    if (state.filterListStatus == ReservationFilterListStatus.loading) {
      return NetworkLoadingWidget();
    } else if (state.filterListStatus == ReservationFilterListStatus.success) {
      if (state.reservationList.isNotEmpty) {
        return SlidableAutoCloseBehavior(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: state.reservationList.length,
            itemBuilder: (context, index) {
              return Slidable(
                key: Key(index.toString()),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(), // 스와이프 애니메이션..
                  children: [
                    SlidableAction(
                      autoClose: true,
                      onPressed: (BuildContext context) {
                        DialogUtils.showBasicDialog(
                          context: context,
                          title: "예약 거절",
                          message:
                              "${state.reservationList[index].name}님의 예약을 거절하시겠습니까?\n(예약을 거절하면 삭제 처리됩니다.)",
                          enableCancelBtn: true,
                          onConfirmClick: () {
                            _reservationCheckBloc.add(
                              ReservationCheckApprovalEvent(
                                request: ReservationApprovalCheckRequestModel(
                                  id: state.reservationList[index].id,
                                  isAgree: false,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      backgroundColor: ColorsConstants.primary,
                      foregroundColor: Colors.white,
                      icon: Icons.delete_forever_outlined,
                      label: !state.reservationList[index].isAuthUser
                          ? '거절'
                          : '삭제',
                    ),
                    Visibility(
                      visible: !state.reservationList[index].isAuthUser,
                      child: SlidableAction(
                        autoClose: true,
                        onPressed: (BuildContext context) {
                          DialogUtils.showBasicDialog(
                            context: context,
                            title: "예약 승인",
                            message:
                                "${state.reservationList[index].name}님의 예약을 승인하시겠습니까?",
                            enableCancelBtn: true,
                            onConfirmClick: () {
                              _reservationCheckBloc.add(
                                ReservationCheckApprovalEvent(
                                  request: ReservationApprovalCheckRequestModel(
                                    id: state.reservationList[index].id,
                                    isAgree: true,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        backgroundColor: ColorsConstants.strokeColor,
                        foregroundColor: Colors.white,
                        icon: Icons.check_rounded,
                        label: '승인',
                      ),
                    ),
                  ],
                ),
                child: ReservationFilterListAdapter(
                  item: state.reservationList[index],
                  onItemClick: () {
                    AutoRouter.of(context)
                        .push(
                      ReservationCheckTabDetailsRoute(
                        id: state.reservationList[index].id,
                      ),
                    )
                        .then((value) {
                      if (value != null) {
                        _reservationCheckBloc.add(
                          ReservationCheckRefreshEvent(),
                        );
                      }
                    });
                  },
                  onItemMoreClick: () {
                    DialogUtils.showBottomSheetDialog(
                      context: context,
                      itemList: [
                        BottomSheetModel(
                          title: "예약 상세 보기",
                          enable: true,
                        ),
                        BottomSheetModel(
                          title: "전화걸기",
                          enable: true,
                        ),
                        BottomSheetModel(
                          title: "예약 승인",
                          enable: !state.reservationList[index].isAuthUser,
                        ),
                        BottomSheetModel(
                          title: "예약 거절(삭제)",
                          enable: true,
                        ),
                      ],
                      onItemClick: (value) {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }

                        if (value == 0) {
                          AutoRouter.of(context).push(
                            ReservationCheckTabDetailsRoute(
                              id: state.reservationList[index].id,
                            ),
                          );
                        } else if (value == 1) {
                          DialogUtils.showBasicDialog(
                            context: context,
                            title: "전화걸기",
                            message:
                                "${state.reservationList[index].name}님에게 전화를 거시겠습니까?\n(${CheckUtils.makePhoneNumber(state.reservationList[index].phoneNumber)})",
                            enableCancelBtn: true,
                            onConfirmClick: () async {
                              final Uri launchUri = Uri(
                                scheme: 'tel',
                                path: state.reservationList[index].phoneNumber,
                              );

                              await launchUrl(launchUri);
                            },
                          );
                        } else if (value == 2) {
                          DialogUtils.showBasicDialog(
                            context: context,
                            title: state.reservationList[index].isAuthUser
                                ? "예약 거절"
                                : "예약 승인",
                            message:
                                "${state.reservationList[index].name}님의 예약을 ${state.reservationList[index].isAuthUser ? "거절" : "승인"}하시겠습니까?",
                            enableCancelBtn: true,
                            onConfirmClick: () {
                              _reservationCheckBloc.add(
                                ReservationCheckApprovalEvent(
                                  request: ReservationApprovalCheckRequestModel(
                                    id: state.reservationList[index].id,
                                    isAgree: !state
                                        .reservationList[index].isAuthUser,
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (value == 3) {
                          DialogUtils.showBasicDialog(
                            context: context,
                            title: "예약 거절",
                            message:
                                "${state.reservationList[index].name}님의 예약을 거절하시겠습니까?\n(예약을 거절하면 삭제 처리됩니다.)",
                            enableCancelBtn: true,
                            onConfirmClick: () {
                              _reservationCheckBloc.add(
                                ReservationCheckApprovalEvent(
                                  request: ReservationApprovalCheckRequestModel(
                                    id: state.reservationList[index].id,
                                    isAgree: false,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              );
            },
          ),
        );
      } else {
        return EmptyWidget(
          message: "${CheckUtils.mappingFilterType(
            state.reservationFilterType,
          )}된 예약이 존재하지 않습니다.",
        );
      }
    } else if (state.filterListStatus == ReservationFilterListStatus.error) {
      return NetworkErrorWidget(
        errorMessage: state.filterListErrorMsg ?? Constants.dataError,
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
