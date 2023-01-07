import 'package:flutter/material.dart';
import 'package:flutter_team/models/problems_model.dart';

class Login_screen extends StatefulWidget 
{
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> 
{
  var text_controller = TextEditingController();

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: Column
      (
        children: 
        [
          Image.network('https://kku.edu.sa/sites/default/files/logo_kku_new2.png', height: 150, width: 150,),
          SizedBox(height: 20,),
          Text("User Name"),
          TextField
          (
            controller: text_controller,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50,),
          Text("Password"),
          TextField
          (
            controller: text_controller,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
          ElevatedButton
          (
            onPressed: () {
              
            }, 
            child: Text("Submit")
          )
        ],
      ),
    );
  }
}