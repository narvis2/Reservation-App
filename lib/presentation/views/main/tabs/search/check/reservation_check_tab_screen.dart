import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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

  @override
  void initState() {
    super.initState();
    _reservationCheckBloc = BlocProvider.of<ReservationCheckBloc>(context)
      ..add(ReservationCheckInitEvent());

    _refreshController = RefreshController(initialRefresh: false);

    _scrollController = ScrollController()..addListener(_nextScroll);
  }

  void _nextScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _reservationCheckBloc.add(ReservationCheckLoadNextDataEvent());
    }
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _reservationCheckBloc.add(ReservationCheckLoadNextDataEvent());
    _refreshController.loadComplete();
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _reservationCheckBloc.add(ReservationCheckInitEvent());
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_nextScroll);
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReservationCheckBloc, ReservationCheckState>(
        bloc: _reservationCheckBloc,
        builder: (context, state) {
          return SmartRefresher(
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
                if(mode == LoadStatus.loading){
                  return NetworkLoadingWidget();
                }

                return SizedBox.shrink();
              },
            ),
            child: ListView.builder(
              itemCount: state.reservationList.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 100,
                  horizontal: 10,
                ),
                child: ListTile(
                  title: Text(state.reservationList[index].name),
                  subtitle: Text(index.toString()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
