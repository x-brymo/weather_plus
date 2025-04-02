// // lib/animations/weather_animations.dart
// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'package:flutter_animate/flutter_animate.dart';

// /// Rain animation that renders falling raindrops
// class RainAnimation extends StatefulWidget {
//   final Color color;
//   final int count;
  
//   const RainAnimation({
//     super.key,
//     this.color = Colors.white70,
//     this.count = 40,
//   });

//   @override
//   State<RainAnimation> createState() => _RainAnimationState();
// }

// class _RainAnimationState extends State<RainAnimation> with TickerProviderStateMixin {
//   late List<AnimationController> _controllers;
//   late List<Raindrop> _raindrops;
  
//   @override
//   void initState() {
//     super