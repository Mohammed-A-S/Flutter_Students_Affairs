import 'package:flutter/material.dart';
import 'package:flutter_team/widgets/Admin_problems_solve.dart';
import 'package:flutter_team/widgets/app_drawer.dart';

class AdminHomeScreen extends StatefulWidget 
{
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> 
{  
  @override
  Widget build(BuildContext context) 
  {
    // var problems = Problems(student_name, Problem, Admin_name, Answer, upvote, downvote)
    return DefaultTabController
    (
      length: 3,
      child: Scaffold
      (
        appBar: AppBar
        (
          title: const Text('Student Problems Page'),
          centerTitle: true,
          bottom: const TabBar
          (
            tabs: 
            [
              Tab(text: "General"),
              Tab(text: "Acadimic"),
              Tab(text: "Schedule"),
            ],
          ), 
        ),


        drawer: const AppDrawer(),


        body: TabBarView
        (
          children:
          [
            const AdminProblemsSolve(),
            Column(),
            Column(),
          ],
        ),
      ),
    );
  }
}