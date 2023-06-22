import 'package:flutter/material.dart';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';

import '../../../../utils/color_constants.dart';
import 'components/top_area_component.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0), // 왼쪽에만 8의 padding을 적용
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
              expandableContent: Container(
                height: constraints.maxHeight * 0.85,
                decoration: BoxDecoration(
                  color: ColorsConstants.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsConstants.divider,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text('Content'),
                ),
              ),
              persistentContentHeight: constraints.maxHeight * 0.6,
            );
          },
        ),
      ),
    );
  }
}