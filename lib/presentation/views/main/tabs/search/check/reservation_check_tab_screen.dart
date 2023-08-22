import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/views/common/empty_widget.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/bloc/reservation_check_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/utils/check_utils.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/widget/check_top_area_widget.dart';

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
      body: BlocBuilder<ReservationCheckBloc, ReservationCheckState>(
        bloc: _reservationCheckBloc,
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
                      // 여러 액션이 있을때 차지하는 비율
                      onPressed: (BuildContext context) {},
                      backgroundColor: ColorsConstants.primary,
                      foregroundColor: Colors.white,
                      icon: Icons.delete_forever_outlined,
                      label: '거절',
                    ),
                    SlidableAction(
                      autoClose: true,
                      // 여러 액션이 있을때 차지하는 비율
                      onPressed: (BuildContext context) {},
                      backgroundColor: ColorsConstants.strokeColor,
                      foregroundColor: Colors.white,
                      icon: Icons.check_rounded,
                      label: '승인',

                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    debugPrint("👠");
                  },
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(state.reservationList[index].name),
                        Text(index.toString()),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return EmptyWidget(
          message: "${CheckUtils.mappingFilterType(
            state.reservationFilterType,
          )} 예약이 존재하지 않습니다.",
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
