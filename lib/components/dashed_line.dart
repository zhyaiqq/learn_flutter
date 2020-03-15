import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final Color color;
  final int count;

  DashedLine({
    @required this.axis,
    this.dashedHeight = 1,
    this.dashedWidth = 1,
    this.color = const Color(0xffcccccc),
    this.count = 10
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
          direction: axis,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(this.count, (int index) {
            return Container(width: dashedWidth, height: dashedHeight, color: color);
          })
        );
      }
    );
  }
}
