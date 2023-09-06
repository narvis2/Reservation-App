import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/di/dependency_injection_graph.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/list_extensions.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/bloc/reservation_calendar_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/reservation_calendar_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/chart/reservation_chart_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/bloc/reservation_check_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/reservation_check_tab_screen.dart';
import 'package:reservation_app/presentation/views/user/bloc/user_info_bloc.dart';

class SearchTabScreen extends StatefulWidget {
  const SearchTabScreen({Key? key}) : super(key: key);

  @override
  State<SearchTabScreen> createState() => _SearchTabScreenState();
}

class _SearchTabScreenState extends State<SearchTabScreen>
    with SingleTickerProviderStateMixin {
  late final UserInfoBloc _userInfoBloc;

  @override
  void initState() {
    super.initState();
    _userInfoBloc = BlocProvider.of<UserInfoBloc>(context);
  }

  List<Tab> _makeTabContent() {
    return Constants.searchTabCategoryList.mapIndexed((item, index) {
      return Tab(
        icon: Icon(
          index == 0
              ? Icons.calendar_month
              : index == 1
                  ? Icons.receipt_long
                  : Icons.bar_chart,
        ),
        text: item,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator.get<ReservationCalendarTabBloc>(),
        ),
        BlocProvider(
          create: (context) => locator.get<ReservationCheckBloc>(),
        ),
      ],
      child: DefaultTabController(
        length: Constants.searchTabCategoryList.length,
        initialIndex: 0,
        child: BlocSelector<UserInfoBloc, UserInfoState, MemberModel?>(
          bloc: _userInfoBloc,
          selector: (state) {
            return state.memberModel;
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: ColorsConstants.background,
                bottom: TabBar(
                  onTap: (index) {
                    if (index > 0 && state == null) {
                      SnackBarUtils.showCustomSnackBar(
                          context, "관리자만 사용가능합니다.",
                      );
                      return;
                    }
                  },
                  labelColor: ColorsConstants.tabBarSubBackground,
                  labelStyle: TextStyle(
                    color: ColorsConstants.tabBarSubBackground,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  unselectedLabelColor: ColorsConstants.textHint,
                  unselectedLabelStyle: TextStyle(
                    color: ColorsConstants.textHint,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  indicatorColor: ColorsConstants.tabBarSubBackground,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                  tabs: _makeTabContent(),
                ),
                toolbarHeight: 0, // AppBar Title 영역을 없애줌
              ),
              body: TabBarView(
                physics: state == null
                    ? NeverScrollableScrollPhysics()
                    : BouncingScrollPhysics(),
                children: [
                  ReservationCalendarTabScreen(),
                  ReservationCheckTabScreen(),
                  ReservationChartTabScreen(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
