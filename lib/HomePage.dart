import 'package:flutter/material.dart';
import './constants/IconData.dart';
import './constants/WeatherConstants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String temp = '26';
  String weather = "S\nU\nN\nN\nY";
  Color color = Colors.black;
  String background = "assets/images/bg1.png";
  String gif = "assets/images/rainy.gif";

  List<bool> isSelected = [
    false,
    true,
    false,
    false,
    false,
    false,
    false,
  ];

  void daySelection(int index) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < isSelected.length;
          buttonIndex++) {
        if (buttonIndex == index) {
          isSelected[buttonIndex] = true;
          temp = weatherList[buttonIndex].temp;
          weather = weatherList[buttonIndex].weather;
          if (weatherList[buttonIndex].id == 5) {
            color = Colors.white;
            gif = "assets/images/night.gif";
            background = "assets/images/bg.png";
          } else {
            color = Colors.black;
            if (weatherList[buttonIndex].id == 2 ||
                weatherList[buttonIndex].id == 6) {
              gif = "assets/images/rainy.gif";
            } else {
              gif = "assets/images/sunny.gif";
            }
            background = "assets/images/bg1.png";
          }
        } else {
          isSelected[buttonIndex] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(background), fit: BoxFit.cover)),
        child: SafeArea(
            child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                temp,
                                style: TextStyle(
                                    fontSize: 100,
                                    fontFamily: "Oxygen",
                                    color: color),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 80,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "o",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: color),
                                  ),
                                  Text(
                                    "C",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "IBM",
                                      color: color,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 350,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(gif),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "TOKYO",
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          fontFamily: "Poppins",
                          color: color,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ToggleButtons(
                      borderRadius: BorderRadius.circular(50),
                      fillColor: Colors.brown.withOpacity(0.4),
                      children: [
                        Icon(
                          sunset,
                          color: color,
                          size: 32,
                        ),
                        Icon(
                          drizzle,
                          color: color,
                        ),
                        Icon(
                          cloud_sun,
                          color: color,
                        ),
                        Icon(
                          sun,
                          color: color,
                        ),
                        Icon(
                          sunset,
                          color: color,
                          size: 32,
                        ),
                        Icon(
                          drizzle,
                          color: color,
                        ),
                        Icon(
                          cloud_sun,
                          color: color,
                        ),
                      ],
                      onPressed: (int index) {
                        daySelection(index);
                      },
                      isSelected: isSelected,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.builder(
                        itemBuilder: (ctx, i) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 11.5, vertical: 5),
                          child: Text(
                            weatherList[i].day,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: color,
                            ),
                          ),
                        ),
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            Positioned(
              right: 20,
              top: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                child: Text(
                  weather,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "IBM",
                    color: color,
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
