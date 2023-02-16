import 'package:flutter/material.dart';

class SquareShape extends StatelessWidget {
  const SquareShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 70.0,
      decoration: const BoxDecoration(
        color: Colors.orange,
      ),
    );
  }
}
