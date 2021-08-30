import 'package:flutter/material.dart';
import 'package:flutter_admin_panel_ui/responsive_layout.dart';

import '../constants.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class ButtonsInfo{
  String title;
  IconData icon;

  ButtonsInfo({required this.title, required this.icon});
}
int _currentIndex = 0;

List<ButtonsInfo> _buttonNames =[
  ButtonsInfo(title: "Home", icon: Icons.home),
  ButtonsInfo(title: "Settings", icon: Icons.settings),
  ButtonsInfo(title: "Notifications", icon: Icons.notifications),
  ButtonsInfo(title: "Contacts", icon: Icons.contact_phone_rounded),
  ButtonsInfo(title: "Sales", icon: Icons.sell),
  ButtonsInfo(title: "Marketing", icon: Icons.mark_email_read),
  ButtonsInfo(title: "Security", icon: Icons.verified_user),
  ButtonsInfo(title: "Users", icon: Icons.supervised_user_circle_rounded),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
          child: Column(
            children: [
              ListTile(
                title: Text("Admin Menu", style: TextStyle(color: Colors.white),),
                trailing: ResponsiveLayout.isComputer(context)?null : IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(
                  Icons.close, color: Colors.white,)),
              ),
              ...List.generate(
                _buttonNames.length,
                    (index) => Column(
                      children: [
                        Container(
                          decoration: index == _currentIndex ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Constants.redDark.withOpacity(0.9),
                            Constants.orangeDark.withOpacity(0.9),
                          ],
                          ),
                          ): null,
                          child: ListTile(title: Text(
                            _buttonNames[index].title,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Icon(
                              _buttonNames[index].icon,
                              color: Colors.white,
                            ),
                          ),
                            onTap: (){
                            setState(() {
                              _currentIndex = index;
                            });
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 0.1,
                        ),
                      ],
                    ),),
            ],
          ),
        ),
      ),
    );
  }
}
