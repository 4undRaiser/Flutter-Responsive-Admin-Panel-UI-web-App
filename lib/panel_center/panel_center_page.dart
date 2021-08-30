import 'package:flutter/material.dart';
import 'package:flutter_admin_panel_ui/panel_center/linear_graph.dart';

import '../constants.dart';

class Person {
  String name;
  Color color;

  Person({required this.color, required this.name});
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  _PanelRightPageState createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelCenterPage> {

  List<Person> _persons = [
    Person( name: "John Mark", color: Constants.orangeLight),
    Person( name: "Fariha Odling", color: Constants.redLight),
    Person( name: "Viola Willis", color: Constants.blueLight),
    Person( name: "Emmett Forrest", color: Constants.orangeLight),
    Person( name: "Nick Jarvis", color: Colors.greenAccent,),
    Person( name: "Amit Clayeia", color: Constants.orangeLight),
    Person( name: "Emily Howardeia", color: Constants.redLight),
    Person( name: "Campbell Britton", color: Constants.blueLight),
    Person( name: "Haley Mellor", color: Constants.redLight),
    Person( name: "Harlen Higgins", color: Colors.greenAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        Padding(
        padding: const EdgeInsets.only(
          left: Constants.kPadding / 2,
          right: Constants.kPadding / 2,
          top: Constants.kPadding ,
        ),
        child: Card(
          color: Constants.purpleLight,
          elevation: 3,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            width: double.infinity,
            child: ListTile(
              title: Text(
                "Products Available",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "82% of the Products Avail.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Chip(
                label: Text(
                  "20,500",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      BarChartSample2(),
      Padding(
        padding: const EdgeInsets.only(
          left: Constants.kPadding / 2,
          right: Constants.kPadding / 2,
          top: Constants.kPadding,
          bottom: Constants.kPadding,
        ),
        child: Card(
          color: Constants.purpleLight,
          elevation: 3,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: List.generate(_persons.length, (index) => ListTile(
              leading: CircleAvatar(
                radius: 15,
                child: Text(
                  _persons[index].name.substring(0,1),
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: _persons[index].color,
              ),
              title: Text(
                _persons[index].name,
                style: TextStyle(color: Colors.white),
              ),
              trailing: IconButton(onPressed: () {},
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ),),
            )),
          ),
        ),
      ),
        ],
      ),
    ),);
  }
}
