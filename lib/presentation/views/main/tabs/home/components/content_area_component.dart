import 'package:flutter/cupertino.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/pager/home_pager_screen.dart';
import '../../../../../utils/color_constants.dart';
import '../widget/custom_tab_bar_widget.dart';

class ContentAreaComponent extends StatefulWidget {
  final double maxHeight;

  const ContentAreaComponent({Key? key, required this.maxHeight})
      : super(key: key);

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
    return SizedBox(
      height: backgroundHeight,
      child: HomePagerScreen(),
    );
  }
}
