import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/presentation/config/router/app_router.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/notice/bloc/content_notice_tab_bloc.dart';

import '../../../../utils/color_constants.dart';
import '../../block/main_bloc.dart';
import 'components/content_area_component.dart';
import 'components/top_area_component.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    final mainBlock = BlocProvider.of<MainBloc>(context);
    final contentNoticeTabBloc = BlocProvider.of<ContentNoticeTabBloc>(context)
      ..add(
        ContentNoticeTabNoticeListEvent(),
      );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: BlocBuilder<ContentNoticeTabBloc, ContentNoticeTabState>(
              bloc: contentNoticeTabBloc,
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ContentNoticeTabStateLoading:
                    return const NetworkLoadingWidget();

                  case ContentNoticeTabStateNoticeListFailed:
                    final errorMessage =
                        (state as ContentNoticeTabStateNoticeListFailed)
                            .message;
                    return NetworkErrorWidget(
                      errorMessage: errorMessage,
                    );

                  case ContentNoticeTabStateNoticeList:
                    final List<NoticeModel> noticeList =
                        (state as ContentNoticeTabStateNoticeList).noticeList;

                    // noticeList.map((e) => WavyAnimatedText(e.title.toString()));
                    return DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorsConstants.splashText),
                      child: AnimatedTextKit(
                        animatedTexts: noticeList
                            .map((e) => WavyAnimatedText(e.title.toString()))
                            .toList(),
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        onTap: () {
                          // debugPrint("$e");
                        },
                        pause: const Duration(milliseconds: 2000),
                      ),
                    );
                  default:
                    return Text("Test");
                }
              }),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Image.asset(
            "assets/images/logo_white.png",
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Image.asset(
                "assets/images/btn_notice.png",
                width: 24.0,
                height: 24.0,
                color: ColorsConstants.splashText,
              ),
              onPressed: () {
                // 클릭 이벤트 처리
                AutoRouter.of(context).push(const NoticeRoute());
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ExpandableBottomSheet(
              background: TopAreaComponent(maxHeight: constraints.maxHeight),
              expandableContent:
                  ContentAreaComponent(maxHeight: constraints.maxHeight),
              persistentContentHeight: constraints.maxHeight * 0.6,
            );
          },
        ),
      ),
      floatingActionButton: BlocBuilder<MainBloc, MainState>(
        bloc: mainBlock,
        builder: (context, state) {
          if (state is HomeTabCurrentPositionState) {
            if (state.currentPosition == 0 || state.currentPosition == 1) {
              return floatingButtons() ?? Container();
            } else {
              return Container();
            }
          }

          return Container();
        },
      ),
    );
  }

  // Custom Floating Action Button
  Widget? floatingButtons() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      visible: true,
      curve: Curves.bounceIn,
      backgroundColor: ColorsConstants.splashText,
      children: [
        SpeedDialChild(
          child: const Icon(
            Icons.app_registration,
            color: Colors.white,
          ),
          label: "예약",
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 13.0,
          ),
          backgroundColor: ColorsConstants.splashText,
          labelBackgroundColor: ColorsConstants.splashText,
          onTap: () {
            AutoRouter.of(context).push(const ReservationRoute());
          },
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.add_chart_rounded,
            color: Colors.white,
          ),
          label: "예약정보 확인",
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 13.0,
          ),
          backgroundColor: ColorsConstants.splashText,
          labelBackgroundColor: ColorsConstants.splashText,
          onTap: () {},
        ),
      ],
    );
  }
}
