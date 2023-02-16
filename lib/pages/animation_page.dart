import 'package:flutter/material.dart';

import 'package:custom_animation/widgets/animated_square.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Animation Example'),
      ),
      body: const Center(
        child: AnimatedSquare(),
      ),
    );
  }
}
