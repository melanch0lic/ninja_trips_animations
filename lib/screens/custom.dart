import 'package:flutter/material.dart';

class DrawingBasedAnimation extends StatefulWidget {
  @override
  _DrawingBasedAnimationState createState() => _DrawingBasedAnimationState();
}

class _DrawingBasedAnimationState extends State<DrawingBasedAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(); // Бесконечное повторение

    _colorAnimation = ColorTween(begin: Colors.white38, end: Colors.red).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(_controller, colorAnimation: _colorAnimation),
      child: SizedBox.expand(),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Animation<double> animation;
  final Animation<Color?> colorAnimation;

  CirclePainter(this.animation, {required this.colorAnimation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = colorAnimation.value!;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * animation.value / 2; // Радиус увеличивается

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
