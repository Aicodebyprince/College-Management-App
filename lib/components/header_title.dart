import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final Color underlineColor;
  final double underlineWidth;
  final double underlineTop;
  final double underlineHeight;
  final bool showUnderline;

  const HeaderTitle({
    super.key,
    this.text = 'Text',
    this.fontSize = 24,
    this.textColor = Colors.black,
    this.underlineColor = Colors.red,
    this.underlineWidth = 115, // Set the default underline width to 115
    this.underlineTop = 30, //Set a default value for the top value
    this.underlineHeight = 3,
    this.showUnderline = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.bottomCenter, // Align the stack to the top center
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            textAlign: TextAlign.center, // Set the text alignment to center
          ),
          if (showUnderline)
            Positioned(
              top: underlineTop, // Use the optional top value
              child: Container(
                width: underlineWidth, // Use the underline width
                height: underlineHeight,
                color: underlineColor,
              ),
            ),
        ],
      ),
    );
  }
}
