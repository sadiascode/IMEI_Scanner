import 'package:flutter/material.dart';

class BgGlow extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const BgGlow({
    super.key,
    required this.color,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
