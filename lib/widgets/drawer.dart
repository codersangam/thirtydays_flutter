import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
            accountName: Text("Sangam Singh"),
            accountEmail: Text("hritriik@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/66767187?v=4"),
            )),
        ListTile(
          leading: Icon(CupertinoIcons.home),
          title: Text("Home"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(CupertinoIcons.profile_circled),
          title: Text("Profile"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(CupertinoIcons.gear),
          title: Text("Settings"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(CupertinoIcons.power),
          title: Text("Logout"),
          onTap: () {},
        ),
      ],
    ));
  }
}
