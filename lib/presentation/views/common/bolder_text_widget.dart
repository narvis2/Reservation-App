import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class BorderTextWidget extends StatelessWidget {
  final List<dynamic> texts;
  final Color? normalColors;
  final Color? bolderColors;
  final double? normalFontSize;
  final double? bolderFontSize;
  final double? letterSpacing;
  final FontWeight? bolderFontWeight;

  const BorderTextWidget({
    Key? key,
    required this.texts,
    this.normalColors,
    this.bolderColors,
    this.normalFontSize,
    this.bolderFontSize,
    this.letterSpacing,
    this.bolderFontWeight,
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
            fontSize: normalFontSize ?? 20,
            letterSpacing: letterSpacing,
          ),
        ));
      } else if (text is List && text.length == 2) {
        spans.add(TextSpan(
          text: text[0],
          style: TextStyle(
            color: bolderColors ?? ColorsConstants.boldColor,
            fontSize: bolderFontSize ?? 20,
            fontWeight: text[1] == true ? bolderFontWeight ?? FontWeight.bold : FontWeight.normal,
            letterSpacing: letterSpacing,
          ),
        ));
      }
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
