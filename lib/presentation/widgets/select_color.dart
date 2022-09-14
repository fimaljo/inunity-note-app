import 'package:flutter/material.dart';
import 'package:inunity/presentation/widgets/circle.dart';

class SelectedColors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Circle(color: 0xff1977F3, onPressed: () {}),
        Circle(color: 0xffF44235, onPressed: () {}),
        Circle(color: 0xff4CAF50, onPressed: () {}),
        Circle(color: 0xff0A557F, onPressed: () {}),
        Circle(color: 0xff9C27B0, onPressed: () {}),
      ],
    );
  }
}
