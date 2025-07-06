import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class UnderlinedText extends StatelessWidget {
  final String text;
  final String url;
  final double textSize;
  final Color textColor;
  final TextDecoration textDecoration;

  const UnderlinedText({
    super.key,
    required this.text,
    required this.url,
    this.textSize = 18,
    this.textColor = const Color(0xFFD9D9D9),
    this.textDecoration = TextDecoration.underline,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Open the URL when the text is tapped
        launchUrl(Uri.parse(url));
      },
      child: Row(
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
              decoration: textDecoration,
              decorationColor: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
