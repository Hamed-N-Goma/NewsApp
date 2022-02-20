import 'package:flutter/material.dart';

import '../Setting/setting.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        scrollDirection: Axis.vertical,
        children: [
          BuildMenuItems(
              icon: Icons.settings_suggest,
              text: "Settings",
              onclick: () => Itemselected(context, 0))
        ],
      ),
    );
  }

  Widget BuildMenuItems(
      {required String text, required IconData icon, VoidCallback? onclick}) {
    const color = Colors.white;
    const hovercolor = Colors.white70;
    return ListTile(
        onTap: onclick,
        hoverColor: hovercolor,
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          text,
          style: const TextStyle(color: color),
        ));
  }
}

Itemselected(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Setting()));
      break;
  }
}
