// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class SmallContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color boxColor;
  final EdgeInsetsGeometry padding;
  final Widget child;

  const SmallContainer({
    super.key,
    required this.height,
    required this.width,
    this.boxColor = const Color(0xFFD9D9D9),
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: padding,
      child: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: boxColor, // New color (#acb8c0)
            borderRadius:
                BorderRadius.circular(15), // Fixed border radius of 15
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: child,
          ),
        ),
      ),
    );
  }
}
