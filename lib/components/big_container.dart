import 'package:flutter/material.dart';

class BigContainer extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Color color;
  final BorderRadiusGeometry borderRadius; // New parameter

  const BigContainer({
    super.key,
    this.color = const Color(0xFFACB8C0),
    required this.height,
    required this.width,
    required this.padding,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)), // Default value
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius, // Use the new borderRadius parameter
          ),
          child: child,
        ),
      ),
    );
  }
}
