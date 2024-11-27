import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool isFav = false;
  late final AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    // Default Tween if from 0 to 1
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_animationController);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 30, end: 50), weight: 50.0),
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 30), weight: 50.0),
    ]).animate(_animationController);
    super.initState();

    _animationController.addListener(() {
      print(_animationController.value);
      print(_colorAnimation.value);
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      }

      if (status == AnimationStatus.dismissed) {
        isFav = false;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Icon(
          Icons.favorite,
          color: _colorAnimation.value,
          size: _sizeAnimation.value,
        ),
      ),
      onPressed: () {
        _animationController.isCompleted ? _animationController.reverse() : _animationController.forward();
      },
    );
  }
}
