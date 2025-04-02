// lib/widgets/animated_background.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../data/services/models/weather/weather_model.dart';


class AnimatedBackground extends StatelessWidget {
  final WeatherCondition condition;

  const AnimatedBackground({
    super.key,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                condition.backgroundColor,
                condition.backgroundColor.withOpacity(0.7),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
        ),
        
        // Weather animation overlay
        Positioned.fill(
          child: Opacity(
            opacity: 0.6,
            child: Lottie.asset(
              condition.animationAsset,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}