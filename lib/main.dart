import 'dart:math';
import 'dart:ui';

import 'package:dictionary/settings.dart';

/// Flutter code sample for LinearGradient

// This sample draws a picture that looks like vertical window shades by having
// a [Container] display a [BoxDecoration] with a [LinearGradient].

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'BalsamiqSans'),
      home: MainPageWidget(),
    );
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  MainPageWidgetState createState() => MainPageWidgetState(true);
}

/// This is the stateless widget that the main application instantiates.
class MainPageWidgetState extends State<MainPageWidget> {
  bool _isStarting = true;
  bool _isUkToMn = true;
  bool _isCenter = true;
  double _width;
  double _height;
  int _selectedBottombar = 0;

  MainPageWidgetState(this._isStarting);

  Widget ukSide() {
    return Container(
      child: Row(
        children: [
          Image.asset('assets/images/uk.jpg', width: 15, height: 15),
          SizedBox(width: 10),
          Center(
              child: Text(
            "English",
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
      height: 30,
      width: 100,
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 29, 15, 75),
          borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget mnSide() {
    return Container(
      child: Row(children: [
        Image.asset('assets/images/mn.png', width: 15, height: 15),
        SizedBox(
          width: 10,
        ),
        Center(
            child: Text(
          "Mongolia",
          style: TextStyle(color: Colors.white),
        )),
      ]),
      height: 30,
      width: 100,
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 29, 15, 75),
          borderRadius: BorderRadius.circular(20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double display_width = MediaQuery.of(context).size.width;
    double display_height = MediaQuery.of(context).size.height;
    BorderRadiusGeometry _borderRadius = BorderRadius.circular(40);

    if (_isStarting) {
      _width = display_width / 1.2;
      _height = display_height / 1.8;
    }
    void _switch() {
      setState(() {});
    }

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color.fromARGB(255, 239, 239, 253), Colors.white])),
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedPositioned(
              top: (_isCenter) ? null : 0,
              bottom: (_isCenter) ? (display_height - _height) / 5 : null,
              duration: Duration(seconds: 1),
              child: AnimatedContainer(
                  width: _width,
                  height: _height,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 40, 24, 92),
                    borderRadius: _borderRadius,
                  ),
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: Stack(
                    children: [
                      (_isCenter)
                          ? Container(
                              child: Image.asset(
                                'assets/images/woman.png',
                                color: Color.fromARGB(255, 65, 5, 215),
                                width: 300,
                                height: 300,
                              ),
                              padding: EdgeInsets.only(top: 12),
                            )
                          : Container(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (_isCenter)
                              ? Column(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Dictionary",
                                          style: TextStyle(
                                            fontFamily: 'BalsamiqSans',
                                            letterSpacing: 2,
                                            color: Colors.white,
                                            fontSize: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "English - Mongolia",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 170,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        (_isUkToMn) ? ukSide() : mnSide(),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isUkToMn = !_isUkToMn;
                                            });
                                          },
                                          child: Container(
                                            child: Image.asset(
                                              'assets/images/change.png',
                                              color: Color.fromARGB(
                                                  255, 98, 62, 215),
                                            ),
                                            padding: EdgeInsets.all(11),
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        (!_isUkToMn) ? ukSide() : mnSide(),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              (!_isCenter)
                                  ? GestureDetector(
                                      onTap: () {
                                        if (!_isCenter) {
                                          setState(() {
                                            _isCenter = true;
                                            _isStarting = true;
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(),
                              (!_isCenter)
                                  ? SizedBox(
                                      width: 20,
                                    )
                                  : Container(),
                              Expanded(
                                child: TextField(
                                  onTap: () {
                                    if (_isCenter) {
                                      setState(() {
                                        _height = display_height / 6;
                                        _width = display_width;
                                        _isCenter = false;
                                        _isStarting = false;
                                      });
                                    }
                                  },
                                  onSubmitted: (value) {
                                    print("clicked search");
                                  },
                                  textInputAction: TextInputAction.search,
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(20.0),
                                        ),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(top: 0),
                                          child: Icon(Icons.search,
                                              color: Color.fromARGB(
                                                  255, 98, 64, 217)))),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: display_height / 9,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: (_selectedBottombar == 0)
                                ? Color.fromARGB(255, 40, 24, 92)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 233, 234, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 40, 24, 92),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedBottombar = 0;
                          });
                        },
                      ),
                    )
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: (_selectedBottombar == 1)
                                ? Color.fromARGB(255, 40, 24, 92)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 233, 234, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 40, 24, 92),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedBottombar = 1;
                          });
                        },
                      ),
                    )
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: (_selectedBottombar == 2)
                                ? Color.fromARGB(255, 40, 24, 92)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 233, 234, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.history,
                          color: Color.fromARGB(255, 40, 24, 92),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedBottombar = 2;
                          });
                        },
                      ),
                    )
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: (_selectedBottombar == 3)
                                ? Color.fromARGB(255, 40, 24, 92)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 233, 234, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 40, 24, 92),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settings()));
                          setState(() {
                            _selectedBottombar = 3;
                          });
                        },
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   items: [
      //     BottomNavigationBarItem(

      //       icon: IconButton(
      //         bo,
      //         icon: Icon(Icons.home), onPressed: () {
      //       }),
      //       title: Text(""),
      //     ),
      //     BottomNavigationBarItem(

      //       icon: Icon(Icons.search, color: Color.fromARGB(255, 40, 24, 92)),
      //       title: Text(""),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.history, color: Color.fromARGB(255, 40, 24, 92)),
      //       title: Text(""),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.star, color: Color.fromARGB(255, 40, 24, 92)),
      //       title: Text(""),
      //     ),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _height = display_height / 3;
      //       _isStarting = false;
      //     });
      //   },
      // ),
    );
  }
}
