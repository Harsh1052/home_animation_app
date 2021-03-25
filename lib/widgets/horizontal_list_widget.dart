import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HorizontalListView extends StatelessWidget {
  final TextStyle textStyle;
  final String assets;
  final String text;
  final Color bgColor;

  HorizontalListView({this.textStyle, this.text, this.assets, this.bgColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
      height: 50.0,
      width: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: bgColor,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            assets,
            height: 25.0,
            width: 25.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            text,
            style: textStyle,
          )
        ],
      ),
    );
  }
}
