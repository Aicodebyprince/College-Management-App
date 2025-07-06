import 'package:flutter/material.dart';

class Underline extends StatelessWidget {
  final Color underlineColor;
  final double underlineWidth;
  final double underlineHeight;
  final double underlineTop;

  const Underline({
    super.key,
    this.underlineColor = Colors.red,
    this.underlineWidth = 100, // Set the default underline width to 115
    this.underlineTop = 30, //Set a default value for the top value
    this.underlineHeight = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: underlineTop,
      child: Container(
        width: underlineWidth,
        height: underlineHeight,
        color: underlineColor,
      ),
    );
  }
}
