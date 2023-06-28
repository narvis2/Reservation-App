import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContentHomeTabScreen extends StatefulWidget {
  const ContentHomeTabScreen({Key? key}) : super(key: key);

  @override
  State<ContentHomeTabScreen> createState() => _ContentHomeTabScreenState();
}

class _ContentHomeTabScreenState extends State<ContentHomeTabScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
                child: Lottie.asset('assets/lottie/loading_animation.json',
                    animate: true,
                    width: 73,
                    height: 73,
                    repeat: true)),
          ],
        ));
  }
}
