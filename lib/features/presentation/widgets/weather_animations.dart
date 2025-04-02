import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RainAnimation extends StatefulWidget {
  final bool isRaining;

  const RainAnimation({super.key, required this.isRaining});

  @override
  _RainAnimationState createState() => _RainAnimationState();
}

class _RainAnimationState extends State<RainAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.isRaining) ...[
          Positioned.fill(
            child: Lottie.asset(
              'assets/animations/rain.json',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: RainPainter(_controller, _random),
            ),
          ),
        ],
      ],
    );
  }
}

class RainPainter extends CustomPainter {
  final AnimationController animation;
  final Random random;
  final int dropCount = 100;
  final List<RainDrop> drops = [];

  RainPainter(this.animation, this.random) : super(repaint: animation) {
    for (int i = 0; i < dropCount; i++) {
      drops.add(RainDrop(random));
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.blueAccent.withOpacity(0.6);

    for (var drop in drops) {
      drop.update(size);
      canvas.drawLine(drop.start, drop.end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class RainDrop {
  late Offset start;
  late Offset end;
  late double speed;
  final Random random;

  RainDrop(this.random) {
    reset(null);
  }

  void update(Size size) {
    start = Offset(start.dx, start.dy + speed);
    end = Offset(end.dx, end.dy + speed);

    if (start.dy > size.height) {
      reset(size);
    }
  }

  void reset(Size? size) {
    final double x = random.nextDouble() * (size?.width ?? 400);
    final double y = random.nextDouble() * -size!.height;
    speed = random.nextDouble() * 4 + 2;
    start = Offset(x, y);
    end = Offset(x, y + 10);
  }
}
