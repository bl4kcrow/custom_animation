import 'package:flutter/material.dart';

import 'package:custom_animation/pages/animation_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationPage(),
    );
  }
}
