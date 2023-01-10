import 'package:flutter/material.dart';
import 'package:flutter_team/screens/admin_screens/admin_home_screen.dart';
import 'package:flutter_team/screens/student_screens/student_home_screen.dart';

class AppDrawer extends StatelessWidget 
{
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
        [
          const DrawerHeader
          (
            decoration: BoxDecoration
            (
              gradient: LinearGradient
              (
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>
                  [
                  Color.fromARGB(255, 247, 207, 237),
                  Color.fromARGB(149, 92, 143, 211),
                  Color.fromARGB(158, 227, 226, 214),
                  ]
              )
            ),
            child: Text("Student Helper", style: TextStyle(fontSize: 25, color: Colors.white),),
          ),
          ListTile
          (
            leading: const Icon(Icons.system_update_tv_rounded),
            title: const Text("Student Pages"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentsHomeScreen(),))
          ),
          ListTile
          (
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text("Admins Pages"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHomeScreen(),))
          ),
        ],
      ),
    );
  }
}