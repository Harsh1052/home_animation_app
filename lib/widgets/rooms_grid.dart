import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_app/screens/bedroom_screen.dart';

import '../constants.dart';

class RoomGridView extends StatelessWidget {
  final String assets;
  final String roomTitle;
  final String lights;

  RoomGridView({this.assets, this.lights, this.roomTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (_, __, ___) {
                  return BedRoomScreen(
                    lights: lights,
                  );
                },
                transitionDuration: Duration(seconds: 1)));
      },
      child: Card(
        shadowColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: EdgeInsets.only(top: 7.0, left: 20.0, bottom: 11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  width: 70.0,
                  height: 90.0,
                  child: SvgPicture.asset(
                    assets,
                  ),
                ),
              ),
              Text(
                roomTitle,
                style: kRoomTitleTextStyle,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                lights,
                style: kLightTitleTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
