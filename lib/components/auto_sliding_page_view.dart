// ignore_for_file: unused_local_variable, library_private_types_in_public_api
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';
// For BackdropFilter

class AutoSlidingPageView extends StatefulWidget {
  const AutoSlidingPageView({super.key});

  @override
  _AutoSlidingPageViewState createState() => _AutoSlidingPageViewState();
}

class _AutoSlidingPageViewState extends State<AutoSlidingPageView> {
  final PageController _pageController = PageController();
  late Timer _timer;

  // List of image paths (defined inside the component)
  final List<String> imagePaths = [
    'assets/slider/slider1.png',
    'assets/slider/slider2.png',
    'assets/slider/slider3.png',
    'assets/slider/slider4.png',
    'assets/slider/slider5.png',
    'assets/slider/slider6.png',
    'assets/slider/slider7.png',
    'assets/slider/slider8.png',
    'assets/slider/slider9.png',
    'assets/slider/slider10.png',
  ];

  @override
  void initState() {
    super.initState();
    // Start the timer to auto-slide every 5 seconds
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        // Check if the current page is the last one
        if (_pageController.page == imagePaths.length - 1) {
          // Jump back to the first page
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          // Go to the next page
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 1,
      height: 200, // Updated height to 200
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Rounded corners
        child: PageView.builder(
          controller: _pageController,
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                // Main image (centered and not blurred)
                Center(
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit
                        .contain, // Display the full image without stretching
                  ),
                ),
                // Background image with blur effect
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 0, sigmaY: 0), // Adjust blur intensity
                    child: Image.asset(
                      imagePaths[index],
                      fit:
                          BoxFit.fill, // Stretch the image to fill the SizedBox
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
