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
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moveToLeft;
  late Animation<double> moveToRight;
  late Animation<double> moveToUp;
  late Animation<double> moveToDown;
  late Animation<double> rotation;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 4500,
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

    opacityOut = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.75,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    moveToRight = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.25,
          curve: Curves.bounceOut,
        ),
      ),
    );

    moveToUp = Tween(
      begin: 0.0,
      end: -100.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.25,
          0.50,
          curve: Curves.bounceOut,
        ),
      ),
    );

    moveToLeft = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.50,
          0.75,
          curve: Curves.bounceOut,
        ),
      ),
    );

    moveToDown = Tween(
      begin: 0.0,
      end: -100.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.75,
          1.0,
          curve: Curves.bounceOut,
        ),
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
        animationController.repeat();
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
            moveToRight.value - moveToLeft.value,
            moveToUp.value - moveToDown.value,
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
