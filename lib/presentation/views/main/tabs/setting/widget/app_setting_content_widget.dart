import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class AppSettingContentWidget extends StatelessWidget {
  final bool isEnable;
  final String title;

  final Function(bool enable) onChange;

  const AppSettingContentWidget({
    Key? key,
    required this.isEnable,
    required this.title,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: ColorsConstants.boldColor,
            ),
          ),
          AnimatedToggleSwitch<bool>.dual(
            current: isEnable,
            first: false,
            second: true,
            borderColor: Colors.transparent,
            dif: 30.0,
            height: 24,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1.5),
              ),
            ],
            onChanged: (b) {
              onChange(b);
              return Future.delayed(Duration(seconds: 2));
            },
            indicatorSize: Size.square(22.0),
            loadingIconBuilder: (context, global) =>
                CupertinoActivityIndicator(
                  color: Color.lerp(
                    ColorsConstants.boldColor,
                    ColorsConstants.background,
                    global.position,
                  ),
                ),
            colorBuilder: (b) => b
                ? ColorsConstants.strokeColor
                : ColorsConstants.strokeGray,
            textBuilder: (value) => value
                ? Center(
              child: Text(
                'ON',
                style:
                TextStyle(color: ColorsConstants.guideText),
              ),
            )
                : Center(
              child: Text(
                'OFF',
                style:
                TextStyle(color: ColorsConstants.guideText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
