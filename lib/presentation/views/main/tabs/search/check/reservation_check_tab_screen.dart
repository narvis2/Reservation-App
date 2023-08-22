import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/common/bolder_text_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/bloc/reservation_check_bloc.dart';

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

  // enablePullUp 이 true 일떄 호출되는 함수
  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _reservationCheckBloc.add(ReservationCheckLoadNextDataEvent());
    _refreshController.loadComplete();
  }

  // enablePullDown 이 true 일때 호출되는 함수
  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _reservationCheckBloc.add(ReservationCheckInitEvent());
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
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                    BorderTextWidget(
                      texts: [
                        "총 예약 : ",
                        [state.totalCount.toString(), true]
                      ],
                      normalColors: ColorsConstants.guideText,
                      bolderColors: ColorsConstants.strokeColor,
                      normalFontSize: 13,
                      bolderFontSize: 14,
                      bolderFontWeight: FontWeight.bold,
                    ),
                    Text(
                      "전체",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorsConstants.boldColor,
                      ),
                    )
                  ],
                ),
              ),
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
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: state.reservationList.length,
                    itemBuilder: (context, index) => SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                        Text(state.reservationList[index].name),
                        Text(index.toString()),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
