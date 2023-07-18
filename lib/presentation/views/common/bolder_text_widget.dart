import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class BorderTextWidget extends StatelessWidget {
  final List<dynamic> texts;
  final Color? normalColors;
  final Color? bolderColors;

  const BorderTextWidget({
    Key? key,
    required this.texts,
    this.normalColors,
    this.bolderColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];
    for (var text in texts) {
      if (text is String) {
        spans.add(TextSpan(
          text: text,
          style: TextStyle(
            color: normalColors ?? ColorsConstants.boldColor,
            fontSize: 20,
          ),
        ));
      } else if (text is List && text.length == 2) {
        spans.add(TextSpan(
          text: text[0],
          style: TextStyle(
            color: bolderColors ?? ColorsConstants.boldColor,
            fontSize: 20,
            fontWeight: text[1] == true ? FontWeight.bold : FontWeight.normal,
          ),
        ));
      }
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
