import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class Button extends StatefulWidget {
  final String text;
  final String? url;
  final VoidCallback? onPressed;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Color buttonColor;
  final double buttonWidth;
  final double buttonHeight;
  final double borderRadius;

  const Button({
    super.key,
    required this.text,
    this.url,
    this.onPressed,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.fontWeight = FontWeight.bold,
    this.buttonColor = const Color(0xFFCD2A2E),
    this.buttonWidth = 120,
    this.buttonHeight = 40,
    this.borderRadius = 10,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    Future<void> onLaunchURL() async {
      await launchUrl(Uri.parse(widget.url!));
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.buttonColor,
        textStyle: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: widget.textColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        ),
        fixedSize: Size(widget.buttonWidth, widget.buttonHeight),
      ),
      onPressed: widget.url != null ? onLaunchURL : widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(color: widget.textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}