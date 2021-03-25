import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class ScenesWidget extends StatelessWidget {
  final String text;
  final Color bgColor;
  ScenesWidget({this.text, this.bgColor});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
        margin: EdgeInsets.only(
          right: 5.0,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: bgColor
            // gradient: LinearGradient(
            //     colors: [bgColor, bgColor], end: Alignment.bottomRight),
            ),
        child: Row(
          children: [
            SizedBox(
              width: 8.0,
            ),
            SvgPicture.asset(
              scenesBulb,
              height: 25.0,
              width: 25.0,
            ),
            SizedBox(
              width: 18.0,
            ),
            Text(
              text,
              style: kHorizontalTextStyle2,
            ),
            SizedBox(
              width: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
