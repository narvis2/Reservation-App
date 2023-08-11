import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/list_extensions.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/reservation_calendar_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/chart/reservation_chart_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/reservation_check_tab_screen.dart';

class SearchTabScreen extends StatefulWidget {
  const SearchTabScreen({Key? key}) : super(key: key);

  @override
  State<SearchTabScreen> createState() => _SearchTabScreenState();
}

class _SearchTabScreenState extends State<SearchTabScreen> {

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
    return DefaultTabController(
      length: Constants.searchTabCategoryList.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.background,
          bottom: TabBar(
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
        body: const TabBarView(
          children: [
            ReservationCalendarTabScreen(),
            ReservationCheckTabScreen(),
            ReservationChartTabScreen(),
          ],
        ),
      ),
    );
  }
}
