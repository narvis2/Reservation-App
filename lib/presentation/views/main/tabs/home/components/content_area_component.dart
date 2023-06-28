
import 'package:flutter/cupertino.dart';
import '../../../../../utils/color_constants.dart';
import '../widget/custom_tab_bar_widget.dart';

class ContentAreaComponent extends StatefulWidget {
  final double maxHeight;

  const ContentAreaComponent({Key? key, required this.maxHeight}) : super(key: key);

  @override
  State<ContentAreaComponent> createState() => _ContentAreaComponentState();
}

class _ContentAreaComponentState extends State<ContentAreaComponent> {
  late double backgroundHeight;

  @override
  void initState() {
    super.initState();
    backgroundHeight = widget.maxHeight * 0.85;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: backgroundHeight,
      decoration: BoxDecoration(
        color: ColorsConstants.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsConstants.divider,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: CustomTabBarWidget(),
    );
  }
}

