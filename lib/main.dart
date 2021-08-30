import 'package:flutter/material.dart';
import 'package:flutter_admin_panel_ui/constants.dart';
import 'package:flutter_admin_panel_ui/widget_tree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Admin Panel UI",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Constants.purpleDark,
        canvasColor: Constants.purpleLight,
      ),
      home: WidgetTree(),
    );
  }
}
