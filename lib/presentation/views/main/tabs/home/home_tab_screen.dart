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
              persistentContentHeight: constraints.maxHeight * 0.55,
            );
          },
        ),
      ),
    );
  }
}