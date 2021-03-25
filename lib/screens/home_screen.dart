import 'package:flutter/material.dart';
import 'package:home_app/constants.dart';
import 'package:home_app/widgets/bottom_app_bar.dart';
import 'package:home_app/widgets/rooms_grid.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: 25.0, left: 25.0, bottom: 25.0, top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Control\nPanel",
                    style: kScreenTitle,
                  ),
                  Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white60,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 60.0,
                      )),
                ],
              ),
            ),
            Expanded(
                child: Hero(
              tag: "hero",
              flightShuttleBuilder: (BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext) {
                return DefaultTextStyle(
                  style: DefaultTextStyle.of(toHeroContext).style,
                  child: toHeroContext.widget,
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0)),
                  color: Color(0xfffafafa),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All Rooms",
                      style: kLabaleTextStyle,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisSpacing: 15.0,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.0,
                        children: [
                          RoomGridView(
                            assets: bedIcon,
                            roomTitle: "Bed room",
                            lights: "4 Lights",
                          ),
                          RoomGridView(
                            assets: room,
                            roomTitle: "Living room",
                            lights: "2 Lights",
                          ),
                          RoomGridView(
                            assets: kitchen,
                            roomTitle: "Kitchen",
                            lights: "5 Lights",
                          ),
                          RoomGridView(
                            assets: bathtubeIcon,
                            roomTitle: "Bathroom",
                            lights: "1 Lights",
                          ),
                          RoomGridView(
                            assets: house,
                            roomTitle: "Outdoor",
                            lights: "5 Lights",
                          ),
                          RoomGridView(
                            assets: balconyIcon,
                            roomTitle: "Balcony",
                            lights: "2 Lights",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
