import 'package:flutter/material.dart';

class ImageTitle extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final Color underlineColor;
  final double underlineWidth;
  final double underlineTop;
  final double underlineHeight;
  final bool showUnderline; // New parameter

  const ImageTitle({
    super.key,
    required this.text,
    this.textSize = 32,
    this.textColor = const Color(0xFFD9D9D9), // Set the default text color to #D9D9D9
    this.underlineColor = Colors.red,
    this.underlineWidth = 115, // Set the default underline width to 115
    this.underlineTop = 30, //Set a default value for the top value
    this.underlineHeight = 4,
    this.showUnderline = true, // Default value for showUnderline
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: textSize, // Set the font size to 32
              fontWeight: FontWeight.w900, // Set the font weight to bold
              color: textColor, // Use the text color
            ),
            textAlign: TextAlign.center, // Set the text alignment to center
          ),
          if (showUnderline) // Conditional rendering of the underline
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
