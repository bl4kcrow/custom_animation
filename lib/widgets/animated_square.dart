import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:custom_animation/widgets/square_shape.dart';

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({super.key});

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> moveToRight;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 4000,
      ),
    );

    rotation = Tween(
      begin: 0.0,
      end: 2.0 * math.pi,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    opacity = Tween(
      begin: 0.1,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.25,
          curve: Curves.easeOut,
        ),
      ),
    );

    moveToRight = Tween(
      begin: 0.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    scale = Tween(
      begin: 0.0,
      end: 2.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationController.addListener(() {
      if (animationController.isCompleted) {
        animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      child: const SquareShape(),
      builder: (BuildContext context, Widget? childSquare) {
        return Transform.translate(
          offset: Offset(
            moveToRight.value,
            0,
          ),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value,
              child: Transform.scale(
                scale: scale.value,
                child: childSquare,
              ),
            ),
          ),
        );
      },
    );
  }
}
