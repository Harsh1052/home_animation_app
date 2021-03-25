import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: EdgeInsets.all(13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 40.0,
                width: 40.0,
                child: SvgPicture.asset(
                  bulbIcon,
                  width: 40.0,
                )),
            Container(height: 40.0, width: 40.0, child: SvgPicture.asset(home)),
            Container(
                height: 40.0, width: 40.0, child: SvgPicture.asset(setting)),
          ],
        ),
      ),
    );
  }
}
