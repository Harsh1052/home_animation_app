import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  final Color color;
  final double animationValue;
  ColorWidget({this.color, this.animationValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: animationValue * 15.0, top: 10.0, bottom: 10.0),
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(25.0)),
    );
  }
}
