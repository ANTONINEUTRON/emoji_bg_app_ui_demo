import 'package:app_ui_demo/data/model/item_model.dart';
import 'package:flutter/material.dart';

class BgWithPattern extends StatelessWidget {
  const BgWithPattern({
    super.key,
    required this.selectedItemModel,
  });

  final ItemModel selectedItemModel;

  @override
  Widget build(BuildContext context) {
    Size screenSiz = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(
          selectedItemModel.colors.colorValue,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      width: screenSiz.width,
      height: screenSiz.height,
      child: CustomPaint(
        painter: TextBackgroundPainter(
          text: selectedItemModel.bgEmojis,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white.withOpacity(0.20),
          ),
        ),
      ),
    );
  }
}

class TextBackgroundPainter extends CustomPainter {
  final String text;
  final TextStyle style;

  const TextBackgroundPainter({
    required this.text,
    required this.style,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(text: text * 20, style: style),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: double.infinity);
    Offset offset = Offset.zero;
    while (offset.dy < size.height) {
      textPainter.paint(canvas, offset);
      offset += Offset(0, textPainter.height);
    }
  }

  @override
  bool shouldRepaint(covariant TextBackgroundPainter oldDelegate) =>
      text != oldDelegate.text || style != oldDelegate.style;
}
