// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final String? url;

  const SmallText({
    super.key,
    required this.text,
    this.textColor =
        const Color(0xFF545454), // Set the default text color to #D9D9D9
    this.textSize = 12,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.bold,
    this.textDecoration = TextDecoration.underline,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return url != null
        ? GestureDetector(
            onTap: () {
              // Open the URL when the text is tapped
              launchUrl(Uri.parse(url!));
            },
            child: Text(
              text,
              style: TextStyle(
                decoration: textDecoration,
                decorationColor: textColor,
                fontSize: textSize, // Set the font size to 32
                fontWeight: fontWeight,
                color: textColor, // Use the text color
              ),
              textAlign: textAlign, // Set the text alignment to center
            ),
          )
        : Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: fontWeight,
              color: textColor,
            ),
            textAlign: textAlign,
          );
  }
}
