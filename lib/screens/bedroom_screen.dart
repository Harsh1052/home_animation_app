import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_app/model/color_data.dart';
import 'package:home_app/widgets/bottom_app_bar.dart';
import 'package:home_app/widgets/colors_widget.dart';
import 'package:home_app/widgets/horizontal_list_widget.dart';
import 'package:home_app/widgets/scenes_widget.dart';

import '../constants.dart';

class BedRoomScreen extends StatefulWidget {
  final String lights;

  BedRoomScreen({this.lights});

  @override
  _BedRoomScreenState createState() => _BedRoomScreenState();
}

class _BedRoomScreenState extends State<BedRoomScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  int sliderValue = 800;

  MaterialColor lightColor = colors.first;
  double x = 200;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeInQuint);
    super.initState();
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: 25.0, left: 25.0, bottom: 25.0, top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              backArrow,
                              width: 25,
                              height: 25,
                            ),
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            "Bed",
                            style: kScreenTitle,
                          ),
                        ],
                      ),
                      Text(
                        "Room",
                        style: kScreenTitle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Opacity(
                        opacity: animation.value,
                        child: Container(
                          transform: Matrix4.translationValues(
                              0, animation.value * 40 - 40, 0),
                          child: Text(
                            widget.lights,
                            style: kLightTitleTextStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    transform: Matrix4.translationValues(
                        0, animation.value * 60 - 60, 0),
                    child: Stack(children: [
                      SizedBox(
                          width: 150,
                          height: 150,
                          child: SvgPicture.asset(lightbulb)),
                      Positioned(
                        right: 60,
                        bottom: 18.0,
                        child: Container(
                          width: 30.0,
                          height: 15.0,
                          decoration: BoxDecoration(
                              color: sliderValue == 0
                                  ? Colors.white
                                  : lightColor[sliderValue],
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0))),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Container(
                transform: Matrix4.translationValues(
                    200 - animation.value * 200, 0, 0),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 30.0,
                    ),
                    HorizontalListView(
                      assets: mainBulb,
                      textStyle: kHorizontalTextStyle,
                      text: "Main Light",
                      bgColor: Colors.white,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    HorizontalListView(
                      assets: furniture,
                      textStyle: kHorizontalTextStyle2,
                      text: "Desk Light",
                      bgColor: Colors.deepPurple[900],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    HorizontalListView(
                      assets: bedIcon2,
                      textStyle: kHorizontalTextStyle,
                      text: "Bed Light",
                      bgColor: Colors.white,
                    ),
                  ],
                )),
            SizedBox(
              height: 20.0,
            ),
            Stack(children: [
              Padding(
                padding: EdgeInsets.only(top: 18.0),
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
                    // transform: Matrix4.translationValues(
                    //     0, animation.value * 130 - 110, 0),
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35.0),
                            topRight: Radius.circular(35.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Intensity",
                          style: kLabaleTextStyle.copyWith(fontSize: 25.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(sliderBulb2,
                                height: 25, width: 25),
                            SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: CupertinoSlider(
                                value: animation.isCompleted
                                    ? sliderValue.toDouble()
                                    : animation.value * sliderValue,
                                min: 0,
                                max: 800,
                                divisions: 8,
                                activeColor: Colors.yellow[800],
                                onChanged: (double value) {
                                  setState(() {
                                    sliderValue = value.toInt();
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            SvgPicture.asset(
                              sliderBulb,
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Colors",
                          style: kLabaleTextStyle.copyWith(fontSize: 25.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 60.0,
                              width: (MediaQuery.of(context).size.width - 108) *
                                  animation.value,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        lightColor = colors[index];
                                      });
                                    },
                                    child: ColorWidget(
                                      color: colors[index],
                                      animationValue: animation.value,
                                    ),
                                  );
                                },
                                itemCount: colors.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0)),
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Scenes",
                          style: kLabaleTextStyle.copyWith(fontSize: 25.0),
                        ),
                        SizedBox(height: 10.0),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ScenesWidget(
                                  text: "Birthday",
                                  bgColor: Colors.red[300],
                                ),
                                ScenesWidget(
                                  text: "Party",
                                  bgColor: Colors.deepPurple[300],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ScenesWidget(
                                  text: "Relax",
                                  bgColor: Colors.blue[300],
                                ),
                                ScenesWidget(
                                  text: "Fun",
                                  bgColor: Colors.green[300],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 25.0,
                  top: 0.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(powerButton),
                    ),
                  ))
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
