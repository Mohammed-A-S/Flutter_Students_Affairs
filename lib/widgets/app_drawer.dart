import 'package:flutter/material.dart';
import 'package:flutter_team/screens/admin_home_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Drawer
    (
      child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: 
        const 
        [
          DrawerHeader
          (
            child: Text("Toggl Clone"),
            decoration: BoxDecoration
            (
              color: Colors.blue
            ),
          ),
          ListTile
          (
            leading: Icon(Icons.system_update_tv_rounded),
            title: Text("Student Pages"),
            //onTap: () => ,
          ),
          ListTile
          (
            leading: Icon(Icons.admin_panel_settings),
            title: Text("Admins Pages"),
          ),
        ],
      ),
    );
  }
}