import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_admin_panel_ui/constants.dart';

import '../constants.dart';
import '../responsive_layout.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];
int _currentSelectedButton = 0;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 30,
                child: Image.asset("images/mapp.png"),
              ),
            )
          else
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconSize: 30,
                color: Colors.white,
                icon: Icon(Icons.menu)),
          SizedBox(width: Constants.kPadding),
          Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
                _buttonNames.length,
                (index) => TextButton(
                    onPressed: () {
                      setState(() {
                        _currentSelectedButton = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(Constants.kPadding * 2),
                      child: Column(
                        children: [
                          Text(
                            _buttonNames[index],
                            style: TextStyle(
                              color: _currentSelectedButton == index
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(Constants.kPadding / 2),
                            width: 60,
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: _currentSelectedButton == index
                                  ? LinearGradient(colors: [
                                      Constants.redDark,
                                      Constants.orangeDark,
                                    ])
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    )))
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_currentSelectedButton],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(Constants.kPadding / 2),
                    width: 60,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Constants.redDark,
                          Constants.orangeDark,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Spacer(),
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          Stack(children: [
            IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.notifications_none_outlined),
            ),
            Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 8,
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ))
          ]),
          if (ResponsiveLayout.isPhone(context))
            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Constants.orangeDark,
                radius: 30,
                child: Image.asset("images/profile.png"),
              ),
            ),
        ],
      ),
    );
  }
}
