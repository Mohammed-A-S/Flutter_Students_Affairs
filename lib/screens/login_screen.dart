import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_team/models/user.dart';
import 'package:flutter_team/screens/admin_screens/admin_home_screen.dart';
import 'package:flutter_team/screens/student_screens/student_home_screen.dart';

class Login extends StatefulWidget 
{
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> 
{
  // List student= ['20230001', 'asd123'];
  // List advisor= ['23001', 'asd123'];

  TextEditingController idController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Stack
      (
        children: 
        [
          Container
          (
            decoration: const BoxDecoration
            (
              gradient: LinearGradient
              (
                colors: 
                [
                  Color.fromARGB(255, 210, 166, 199),
                  Color.fromARGB(148, 65, 108, 164),
                  Color.fromARGB(158, 193, 190, 162),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Container
          (
            margin: const EdgeInsets.only(left:60, top: 20),
            width: 300,
            height: 300,
            child: Image.asset('assets/w1_p.png'),
          ),
          
          Container
          (
            width: 600,
            height: 900,
            margin: EdgeInsets.only(top: 300),
            decoration: const BoxDecoration
            (
              gradient: LinearGradient
              (
                colors: 
                [
                  Color.fromARGB(255, 247, 207, 237),
                  Color.fromARGB(149, 92, 143, 211),
                  Color.fromARGB(158, 227, 226, 214),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only
              (
                topLeft: Radius.circular(80),
              ),
            ),
          ),

          Container
          (
            width: 580,
            height: 900,
            margin: const EdgeInsets.only(top: 320, left: 20),
            decoration: const BoxDecoration
            (
              borderRadius: BorderRadius.only
              (
                topLeft: Radius.circular(80),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only
            (
              left: 30.0, right: 50.0, top: 150, bottom: 0
            ),
            child:  TextField
            (
              controller: idController,
              decoration: const InputDecoration
              (
                border: OutlineInputBorder(),
                labelText: 'User ID',
                hintText: 'Enter Student ID OR Advisor ID'
              ),
            ),
          ),

          Container
          (
            padding: const EdgeInsets.only
            (
              left: 50.0, right: 50.0, top: 350, bottom: 0
            ),
            child: const Text('LOGIN',style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 139, 107, 198)),),
          ),

          Container
          (
            padding: const EdgeInsets.only
            (
              left: 50.0, right: 50.0, top: 550, bottom: 0
            ),
            child:  TextField
            (
              controller: pwdController,
              decoration: const InputDecoration
              (
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter password'
              ),
            ),
          ),

          Container
          (
            padding: const EdgeInsets.only(left: 280.0, right: 40.0, top: 700, bottom: 0),
            child: ElevatedButton
            (
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 134, 53, 206)),
              onPressed: () 
              {
                bool hasAccess = false;
                var userData = null;
                
                for(var user in User.users) 
                {
                  if(user.id == idController.text && user.password == pwdController.text)
                  {
                    hasAccess = true;
                    userData = user;
                    break;
                  }
                }
                if(hasAccess) 
                {
                  if(userData.role == 1) 
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHomeScreen(),));
                    print("Admin");
                  } 
                  else 
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentsHomeScreen(),));
                    print("Student");
                  }
                } 
                else 
                {
                  print('No User Found');
                }
              },
              child: const Text('Login' , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
          )
        ]
      ),
    );
  }
}
