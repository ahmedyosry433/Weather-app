import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          Image.asset(
            'assets/image/00.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Blurred Image Overlay
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          // Your content goes here
          LoadingAnimationWidget.inkDrop(
            color: Colors.white,
            size: 100,
          )
        ],
      ),
    );
  }
}
