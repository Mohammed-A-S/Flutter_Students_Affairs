import 'package:flutter/material.dart';
import 'package:flutter_team/Team_sharing/problem_page.dart';
import 'package:flutter_team/screens/student_home_screen.dart';
import 'package:flutter_team/widgets/Admin_problems_solve.dart';

void main() 
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      home: AddingPage(),
    );
  }
}

