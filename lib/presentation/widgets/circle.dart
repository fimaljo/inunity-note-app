import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final int color;
  final VoidCallback onPressed;

  const Circle({required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      onTap: onPressed,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Color(color)),
      ),
    );
  }
}
